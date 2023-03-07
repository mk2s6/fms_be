const express = require('express');
const db = require('./db-payment-methods');
const pool = require('../../database/db');
const RG = require('../../model/response-generator');
const { paramPMIdValidation } = require('./validations');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** payment-methods-status-toggle ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {PUT} /payment-methods/:id/status payment methods status toggle
 * @apiName payment methods status toggle
 * @apiGroup payment methods
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiSampleRequest /payment-methods/:id/status
 */
router.put('/:id/status', paramPMIdValidation, async (req, res) => {
  const log = req.logger;
  try {
    await db.togglePaymentMethodStatus(log, pool, req.user, req.body.active, req.params.id);

    return RG.respondSuccess(res)('payment method status update', 'payment method status updated Successfully.!!!', []);
  } catch (e) {
    log.error({ msg: routeName('Error'), err: e });
    if (!e.type && typeof e === 'string') return RG.respondInternalError(res)(e);
    return RG.respondInternalError(res)('ERR_LOGIN_TOKEN_GENERATION_ERROR');
  }
});

module.exports = router;
