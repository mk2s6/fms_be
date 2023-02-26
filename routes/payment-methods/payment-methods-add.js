const express = require('express');
const db = require('./db-payment-methods');
const pool = require('../../database/db');
const RG = require('../../model/response-generator');
const { addPM } = require('./validations');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** payment-methods-add ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} /payment-methods payment methods add
 * @apiName payment methods add
 * @apiGroup payment methods
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiSampleRequest /payment-methods
 */
router.post('/', addPM, async (req, res) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));

  try {
    const [rows] = await db.addPaymentMethod(log, pool, req.user, req.body);

    return RG.respondSuccess(res)('lending addition', 'lending added Successfully.!!!', []);
  } catch (e) {
    log.error({ msg: routeName('Error'), err: e });
    if (!e.type && typeof e === 'string') return RG.respondInternalError(res)(e);
    return RG.respondInternalError(res)('ERR_LOGIN_TOKEN_GENERATION_ERROR');
  }
});

module.exports = router;
