const express = require('express');
const db = { ...require('./db-lendings'), ...require('../transactions/db-transactions') };
const pool = require('../../database/db');
const { startTransaction, rollbackTransaction, commitTransaction } = require('../../model/execute-db-transactions');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');
const { addLending } = require('./validations');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** lending-add ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} /lendings lending add
 * @apiName lending add
 * @apiGroup lending
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiSampleRequest /lendings
 */
router.post('/', addLending, async (req, res) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  let T;
  try {
    T = await startTransaction(log, pool);

    const [rows] = await db.addLending(log, T, req.user, req.body);

    const lending = { ...req.body, lendingId: rows.insertId, type: req.body.isBorrowed ? 'CREDIT' : 'DEBIT' };

    await db.addTransaction(log, T, req.user, { ...lending, description: lending.details, date: lending.onDate });

    await commitTransaction(log, T);

    return RG.respondSuccess(res)('lending addition', 'lending added Successfully.!!!', []);
  } catch (e) {
    log.error({ msg: routeName('Error'), err: e });
    T && (await rollbackTransaction(log, T));
    if (!e.type && typeof e === 'string') return RG.respondInternalError(res)(e);
    return RG.respondInternalError(res)('ERR_LOGIN_TOKEN_GENERATION_ERROR');
  }
});

module.exports = router;
