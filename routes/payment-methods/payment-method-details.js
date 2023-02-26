const express = require('express');
const db = require('./db-payment-methods');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');
const { addPM, paramPMIdValidation } = require('./validations');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** payment-method-details ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {GET} /payment-method/:payment-method_id payment-method details
 * @apiName payment-method details
 * @apiGroup payment-method
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiParam {String} payment-method_id payment-method Id
 *
 * @apiSampleRequest /payment-method/:payment-method_id
 */
router.get('/:id', paramPMIdValidation, async (req, res) => {
  const log = req.logger;
  try {
    const [rows] = await db.paymentMethodDetails(log, pool, req.user, req.params.id);
    return res.status(200).send(RG.success('payment-method details', 'payment-method details Successfully retrieved!!!', rows));
  } catch (e) {
    log.error({ msg: routeName('Error'), err: e });
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(400).send(generateToken);
  }
});

module.exports = router;
