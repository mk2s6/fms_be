const express = require('express');
const pool = require('../../database/db');
const RG = require('../../model/response-generator');
const { addTransaction } = require('../transactions/validations');
const { addLending, paramLendingIdValidation } = require('./validations');

const db = { ...require('./db-lendings'), ...require('../transactions/db-transactions') };

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** ledger-transaction-add ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} /lendings/:lending_id/transaction Lendings add transaction
 * @apiName Lendings add transaction
 * @apiGroup Lendings
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiParam {String} lending_id Lending id to which we are adding the transaction
 *
 * @apiBody {String} purpose Purpose of ledger
 * @apiBody {String} description Detailed description of ledger
 * @apiBody {String} category Category of ledger
 *
 * @apiSampleRequest  /lendings/:lending_id/transaction
 */
router.post('/:id/transaction', addTransaction, paramLendingIdValidation, async (req, res) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  try {
    const [lending] = await db.lendingDetails(log, pool, req.user, req.params.id);
    if (lending.length !== 1) {
      return RG.respondDBError(res)('ERR_TRANSACTION_CAN_NOT_BE_ADDED_TO_LENDING');
    }

    if (lending[0].settlementStatus === 1) {
      return RG.respondDBError(res)('ERR_TRANSACTION_CAN_NOT_BE_ADDED_TO_CLOSED_LENDING');
    }

    const transaction = { ...req.body, lendingId: lending[0].id };

    await db.addTransaction(log, pool, req.user, transaction);

    return RG.respondSuccess(res)('Ledger transaction added', 'Ledger transaction added successfully!!!', [transaction]);
  } catch (e) {
    log.error({ msg: routeName(`Error: ${e.message}`), err: e });
    return RG.respondInternalError(res)('ERR_LEDGER_TRANSACTION_ADD_FAILURE');
  }
});

module.exports = router;
