const express = require('express');
const db = require('./db-ledgers');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** ledgers-details ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {GET} /ledgers/:ledger_id Ledgers details
 * @apiName Ledgers details
 * @apiGroup Ledgers
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiParam {String} ledger_id Ledgers Id
 *
 * @apiSampleRequest /ledgers/:ledger_id
 */
router.get('/:id', async (req, res) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  try {
    const [rows] = await db.ledgerDetails(log, pool, req.user, req.params.id);
    return res.status(200).send(RG.success('Ledgers list', 'Ledgers list Successfully retrieved!!!', rows));
  } catch (e) {
    log.error({ msg: routeName('Error'), err: e });
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(400).send(generateToken);
  }
});

module.exports = router;
