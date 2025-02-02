const express = require('express');
const config = require('config');
const auth = require('../../model/auth');
const RG = require('../../model/response-generator');
const constant = require('../../model/constant');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const { passwordValidations } = require('./validations');

const db = require('./db-users');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** user-change-password ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} users/my/password User Set/Update password
 * @apiName User Set/Update password
 * @apiGroup Users
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token authentication token
 *
 * @apiBody {String} password="Qwerty@12" User Update Password
 *
 * @apiSampleRequest /users/my/password
 */
router.post('', passwordValidations, async (req, res) => {
  const log = req.logger;
  log.info(routeName());

  let hashedPassword = '';

  try {
    hashedPassword = await auth.hashPassword(req.body.password);
  } catch (e) {
    log.error(routeName(e.message), { error: e.stack });
    const responseUnableToHash = RG.internalError(errList.internalError.ERR_HASH_PASSWORD);
    return res.status(500).send(responseUnableToHash);
  }

  try {
    const [rows] = await db.setUserPassword(log, pool, req.user, hashedPassword);
    if (!rows.affectedRows) {
      const rowCheck = errList.dbError.ERR_RESTAURANT_EMPLOYEE_SET_PIN_FATAL_AFFECTED_ROWS_0;
      return res.status(500).send(rowCheck);
    }
    return res.status(200).send(RG.success('User password update', 'User password updated successfully', []));
  } catch (e) {
    log.error(routeName(e.message), { error: e.stack });
    const exceptionErr = RG.internalError(errList.internalError.ERR_EMPLOYEE_UPDATE_PASSWORD_NO_UPDATE_NO_EXCEPTION);
    return res.status(400).send(exceptionErr);
  }
});

module.exports = router;
