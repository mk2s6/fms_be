const express = require('express');
const db = require('./db-payment-methods');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** payment-methods-list ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {GET} lendings Lendings List
 * @apiName Lendings list
 * @apiGroup Lendings
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiSampleRequest /lendings
 */
router.get('/', async (req, res) => {
  const log = req.logger;
  try {
    const [rows] = await db.paymentMethodsList(log, pool, req.user, req.query);

    return res.status(200).send(RG.success('Payment methods list', 'Payment methods list Successfully retrieved!!!', rows));
  } catch (e) {
    console.log(e);
    log.error({ msg: routeName('Error'), err: e });
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(400).send(generateToken);
  }
});

module.exports = router;
