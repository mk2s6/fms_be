const express = require('express');
const db = { ...require('./db-lendings'), ...require('../transactions/db-transactions') };
const pool = require('../../database/db');
const { startTransaction, rollbackTransaction, commitTransaction } = require('../../model/execute-db-transactions');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');
const { addLending, paramLendingIdValidation } = require('./validations');
const { getCurrentDateTime } = require('../../utils/dates');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** lending-settle ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} /lendings lending settle
 * @apiName lending settle
 * @apiGroup lending
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiSampleRequest /lendings
 */
router.put('/:id', paramLendingIdValidation, async (req, res, next) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  let T;
  try {
    T = await startTransaction(log, pool);

    const settlementTime = getCurrentDateTime();

    await db.settleLending(log, T, req.user, req.params.id);

    const [[lending]] = await db.lendingDetails(log, T, req.user, req.params.id);

    await db.addTransaction(log, T, req.user, {
      ...lending,
      lendingId: lending.id,
      purpose: `${lending.purpose} - Settlement`,
      description: `${lending.details} - Settlement`,
      date: settlementTime,
      type: lending.borrowingStatus ? 'DEBIT' : 'CREDIT',
    });

    await commitTransaction(log, T);

    return RG.respondSuccess(res)('lending settle', 'lending settled Successfully.!!!', []);
  } catch (e) {
    log.error({ msg: e, location: routeName('Error') });
    T && (await rollbackTransaction(log, T));
    if (e instanceof RG.APIError) {
      return next(e);
    }
    return next(new RG.APIError(1, 'ERR_INTERNAL_SERVER_ERROR'));
  }
});

module.exports = router;
