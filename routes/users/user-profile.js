/* eslint-disable global-require */
const express = require('express');
const config = require('config');
const vs = require('../../model/validator-sanitizer');
const auth = require('../../model/auth');
const RG = require('../../model/response-generator');
const constant = require('../../model/constant');
const pool = require('../../database/db');
const { errList } = require('../../model/error');

const db = require('./db-users');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** user-profile ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {GET} users/my/profile User profile
 * @apiName User profile
 * @apiGroup Users
 * @apiVersion 0.0.1
 * @apiPermission User who logged in can access the resource
 *
 * @apiHeader {String} x-id-token User login authentication token
 *
 * @apiSampleRequest /users/my/profile
 */
router.get('', async (req, res) => {
  const log = req.logger;
  log.info(routeName());
  try {
    const [rows] = await db.getUserProfileDetails(log, pool, req.user);
    return res.status(200).send(RG.success('User Profile', 'User profile Successfully retrieved!!!', rows));
  } catch (e) {
    log.error(e.message, e);
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(400).send(generateToken);
  }
});

module.exports = router;
