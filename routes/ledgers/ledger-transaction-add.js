const express = require('express');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');
const { addTransaction } = require('../transactions/validations');
const { addLedger } = require('./validations');

const db = { ...require('./db-ledgers'), ...require('../transactions/db-transactions') };

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** ledger-transaction-add ${str ? `|| ${str}` : ''} ***`;

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
router.post('/:id/transaction', addTransaction, async (req, res) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  try {
    const [ledgerDetails] = await db.ledgerDetails(log, pool, req.user, req.params.id);
    if (ledgerDetails.length !== 1) {
      return RG.respondDBError(res)('ERR_TRANSACTION_CAN_NOT_BE_ADDED_TO_LEDGER');
    }

    if (ledgerDetails[0].status === 0) {
      return RG.respondDBError(res)('ERR_TRANSACTION_CAN_NOT_BE_ADDED_TO_CLOSED_LEDGER');
    }

    const transaction = { ...req.body, ledgerId: ledgerDetails[0].id };

    await db.addTransaction(log, pool, req.user, transaction);

    return RG.respondSuccess(res)('Ledger transaction added', 'Ledger transaction added successfully!!!', [transaction]);
  } catch (e) {
    log.error({ msg: routeName(`Error: ${e.message}`), err: e });
    return RG.respondInternalError(res)('ERR_LEDGER_TRANSACTION_ADD_FAILURE');
  }
});

module.exports = router;
