const express = require('express');
const db = require('./db-lendings');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');
const { paramLendingIdValidation } = require('./validations');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** lending-details ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {GET} /lending/:lending_id lending details
 * @apiName lending details
 * @apiGroup lending
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiParam {String} lending_id lending Id
 *
 * @apiSampleRequest /lending/:lending_id
 */
router.get('/:id', paramLendingIdValidation, async (req, res) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  try {
    const [rows] = await db.lendingDetails(log, pool, req.user, req.params.id);
    return res.status(200).send(RG.success('lending details', 'lending details Successfully retrieved!!!', rows));
  } catch (e) {
    log.error({ msg: routeName('Error'), err: e });
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(400).send(generateToken);
  }
});

module.exports = router;
