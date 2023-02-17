const express = require('express');
const db = require('./db-ledgers');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');
const { addLedger } = require('./validations');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** ledger-add ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} /ledgers Transactions add
 * @apiName Transactions add
 * @apiGroup Transactions
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiBody {String} purpose Purpose of ledger
 * @apiBody {String} description Detailed description of ledger
 * @apiBody {String} category Category of ledger
 *
 * @apiSampleRequest /ledgers
 */
router.post('/', addLedger, async (req, res) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  try {
    await db.addLedger(log, pool, req.user, req.body);
    return res.status(200).send(RG.success('Ledger added', 'Ledger added successfully!!!', [req.body]));
  } catch (e) {
    log.error({ msg: routeName('Error'), err: e });
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(400).send(generateToken);
  }
});

module.exports = router;
