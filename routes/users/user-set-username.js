const express = require('express');
const auth = require('../../model/auth');
const RG = require('../../model/response-generator');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const { usernameCheck } = require('./validations');

const db = { ...require('./db-users') };

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** users-set-username ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {PUT} users/my/username User Set/Update Username
 * @apiName User Set/Update Username
 * @apiGroup Users
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token authentication token
 *
 * @apiBody {String} username="mk2s" User LOCK PIN
 *
 * @apiSampleRequest /users/my/username
 */
router.put('', usernameCheck, async (req, res) => {
  const log = req.logger;
  log.info(routeName());

  try {
    const [rows] = await db.setUserUsername(log, pool, req.user, req.body);
    if (!rows.affectedRows) {
      const rowCheck = errList.dbError.ERR_RESTAURANT_EMPLOYEE_SET_USERNAME_FATAL_AFFECTED_ROWS_0;
      return res.status(400).send(rowCheck);
    }
    return res.status(200).send(RG.success('User Username', 'User Username set successfully', [{ username: req.body.username }]));
  } catch (e) {
    log.error(routeName(e.message), { error: e.stack });
    if (e.code === 'ER_DUP_ENTRY') {
      const duplicateEntry = errList.dbError.ERR_RESTAURANT_EMPLOYEE_USERNAME_CHECK_NOT_AVAILABLE;
      return res.status(400).send(duplicateEntry);
    }
    const exceptionErr = RG.internalError(errList.internalError.ERR_EMPLOYEE_UPDATE_PASSWORD_ERROR);
    return res.status(500).send(exceptionErr);
  }
});

module.exports = router;
