const express = require('express');
const db = require('./db-transactions');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');
const { addTransaction, paramTransactionIdValidation } = require('./validations');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** transaction-delete ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {PUT} /transactions/:transaction_id Transactions delete
 * @apiName Transactions delete
 * @apiGroup Transactions
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiParam {string} transaction_id Transaction id
 *
 * @apiBody {String} purpose Purpose of transaction
 * @apiBody {String} description Detailed description of transaction
 * @apiBody {String} category Category of transaction
 * @apiBody {String} type Type of transaction CREDIT DEBIT
 * @apiBody {String} mode transaction mode
 * @apiBody {String} date transaction date
 * @apiBody {Number} amount Transaction Amount
 *
 * @apiSampleRequest /transactions/:transaction_id
 */
router.put('/:id', addTransaction, paramTransactionIdValidation, async (req, res) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  try {
    await db.transactionUpdateStatus(log, pool, req.user, req.params.id);
    await db.updateTransaction(log, pool, req.user, { ...req.body, id: req.params.id });
    return res.status(200).send(RG.success('Transactions update', 'Transactions updated Successfully!!!', [req.body]));
  } catch (e) {
    log.error({ msg: routeName('Error'), err: e });
    if (!isNaN(e.type)) return res.status(400).send(e);
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(400).send(generateToken);
  }
});

module.exports = router;
