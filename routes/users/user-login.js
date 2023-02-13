const express = require('express');
const auth = require('../../model/auth');
const RG = require('../../model/response-generator');
const constant = require('../../model/constant');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const { userLoginValidations } = require('./validations');
const { insertSessionDetails, getSessionDetailsById } = require('../auth/db-auth');

const db = require('./db-users');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** users-login ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} users/login User login
 * @apiName User login
 * @apiGroup Users
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} code=MK2S12 Restaurant Authentication code
 *
 * @apiBody {String} username=siva.kusi username of an employee can be username, email or mobile
 * @apiBody {String} password=b8mX1AK$ password of the employee to login
 * @apiBody {Boolean} rememberMe=false password of the employee to login
 *
 * @apiSampleRequest /users/login
 */
router.post('', userLoginValidations, async (req, res) => {
  const log = req.logger;
  log.info(routeName());

  let loginDetails;
  const loginObject = { username: req.body.username };

  try {
    [loginDetails] = await db.getUserDetailsForLogin(log, pool, loginObject);
  } catch (e) {
    log.error({ msg: routeName(e.message), error: e });
    const responseExceptionInSelect = RG.internalError(errList.internalError.ERR_LOGIN_SELECT_THROW_EXCEPTION);
    return res.status(500).send(responseExceptionInSelect);
  }
  if (loginDetails.length !== 1) {
    const responseUserNotExist = RG.dbError(errList.dbError.ERR_USER_LOGIN_USER_DOES_NOT_EXIST);
    return res.status(400).send(responseUserNotExist);
  }

  let isValidPwd;
  try {
    isValidPwd = await auth.verifyPassword(req.body.password, loginDetails[0].password);
  } catch (e) {
    // Unable to compare hash and Password
    log.error({ msg: routeName(e.message), error: e });
    const responseUnableToCompareHash = RG.internalError(errList.internalError.ERR_COMPARE_PASSWORD_AND_HASH);
    return res.status(400).send(responseUnableToCompareHash);
  }
  if (!isValidPwd) {
    const responsePasswordNoMatch = RG.dbError(errList.dbError.ERR_LOGIN_USER_PASSWORD_NO_MATCH);
    return res.status(400).send(responsePasswordNoMatch);
  }
  let token;
  try {
    token = auth.genAuthToken(
      {
        id: loginDetails[0].id,
        token_type: constant.tokenType.EMPLOYEE,
      },
      req.body.rememberMe,
    );
  } catch (e) {
    log.error({ msg: routeName(e.message), error: e });
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(400).send(generateToken);
  }

  let validity = null;

  const date = new Date();
  validity = date.setDate(date.getDate() + req.body.rememberMe ? 30 : 2);
  validity = new Date(validity).toISOString().replace('T', ' ').replace('Z', '');

  const sessionObject = { jwt: token, validity, host: req.hostname, ip: req.ip };
  let sessionDetails;

  try {
    log.verbose({ msg: routeName('Session Object'), data: sessionObject });
    [sessionDetails] = await insertSessionDetails(sessionObject);
  } catch (e) {
    log.error({ msg: routeName(e.message), error: e });
    const responseExceptionInSelect = RG.internalError(errList.internalError.ERR_LOGIN_SELECT_THROW_EXCEPTION);
    return res.status(500).send(responseExceptionInSelect);
  }

  try {
    [sessionDetails] = await getSessionDetailsById(sessionDetails.insertId);
  } catch (e) {
    log.error({ msg: routeName(e.message), error: e });
    const responseExceptionInSelect = RG.internalError(errList.internalError.ERR_LOGIN_SELECT_THROW_EXCEPTION);
    return res.status(500).send(responseExceptionInSelect);
  }

  let sessionId = sessionDetails[0].uss_session_id;
  const items = { id: loginDetails[0].code, name: loginDetails[0].name, token: sessionId };

  return res
    .status(200)
    .header(constant.TOKEN_NAME, sessionId)
    .send(RG.success('User login', 'Login Successful!!!', [items]));
});

module.exports = router;
