const express = require('express');
const config = require('config');
const auth = require('../../model/auth');
const RG = require('../../model/response-generator');
const constant = require('../../model/constant');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const { usernameCheck } = require('./validations');

const db = require('./db-users');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** user-check-username ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {PATCH} users/username User check username
 * @apiName User check username
 * @apiGroup Users
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token authentication token
 *
 * @apiBody {String} username="mk2s6" Username of the user
 *
 * @apiSampleRequest /users/username
 */
router.patch('', usernameCheck, async (req, res) => {
  const log = req.logger;
  log.info(routeName());

  try {
    const [rows] = await db.checkUsername(log, pool, req.body, req.user);
    log.verbose(routeName('Rows Count'), { data: rows });
    if (rows[0].count) {
      log.error(routeName('Users User name check'), { data: rows[0] });
      const generateToken = RG.dbError(errList.dbError.ERR_RESTAURANT_EMPLOYEE_USERNAME_CHECK_NOT_AVAILABLE);
      return res.status(400).send(generateToken);
    }
    return res.status(200).send(RG.success('User Username check', 'User Username check Successful!!!', [{ isAvailable: !rows[0].count }]));
  } catch (e) {
    log.error(e.message, e);
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(500).send(generateToken);
  }
});

module.exports = router;
