const express = require('express');
const db = require('./db-transactions');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');
const { addTransaction } = require('./validations');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** transaction-add ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} /transactions Transactions add
 * @apiName Transactions add
 * @apiGroup Transactions
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiBody {String} purpose Purpose of transaction
 * @apiBody {String} description Detailed description of transaction
 * @apiBody {String} category Category of transaction
 * @apiBody {String} type Type of transaction CREDIT DEBIT
 * @apiBody {String} mode transaction mode
 * @apiBody {String} date transaction date
 * @apiBody {Number} amount Transaction Amount
 *
 * @apiSampleRequest /transactions
 */
router.post('/', addTransaction, async (req, res) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  try {
    const [rows] = await db.addTransaction(log, pool, req.user, req.body);
    return res.status(200).send(RG.success('Transactions list', 'Transactions list Successfully retrieved!!!', [req.body]));
  } catch (e) {
    log.error({ msg: routeName('Error'), err: e });
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(400).send(generateToken);
  }
});

module.exports = router;
