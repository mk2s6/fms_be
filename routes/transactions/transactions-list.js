const express = require('express');
const db = require('./db-transactions');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** transactions-list ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {GET} transactions Transactions List
 * @apiName Transactions list
 * @apiGroup Transactions
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiSampleRequest /transactions
 */
router.get('/', async (req, res) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  try {
    const [rows] = await db.transactionsList(log, pool, req.user, req.query);
    return res.status(200).send(RG.success('Transactions list', 'Transactions list Successfully retrieved!!!', rows));
  } catch (e) {
    log.error({ msg: routeName('Error'), err: e });
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(400).send(generateToken);
  }
});

module.exports = router;
