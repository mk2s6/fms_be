const express = require('express');
const config = require('config');
const auth = require('../../model/auth');
const RG = require('../../model/response-generator');
const constant = require('../../model/constant');
const pool = require('../../database/db');
const { errList } = require('../../model/error');
const { registerValidations } = require('./validations');
const { sendEmail } = require('../../model/mailer');

const db = require('./db-users');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** users-register ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} users/register User register
 * @apiName User register
 * @apiGroup Users
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token authentication token
 *
 * @apiBody {String} name="Test User" Full Name of the employee
 * @apiBody {String} email=siva.kusi12@gmail.com Email of the employee
 * @apiBody {String} mobile=+918106302821 Mobile number of the employee with country code
 * @apiBody {String} password="Qwerty12$" User login password
 * @apiBody {String} username="siva.kusi" User login username
 *
 *
 * @apiSampleRequest /users/register
 */
router.post('', registerValidations, async (req, res) => {
  const log = req.logger;
  log.info(routeName());
  const password = req.body.password;

  let hashedPassword = '';

  try {
    hashedPassword = await auth.hashPassword(password);
    req.body.password = hashedPassword;
  } catch (e) {
    log.error(routeName(e.message), e);
    const responseUnableToHash = RG.internalError(errList.internalError.ERR_HASH_PASSWORD);
    return res.status(500).send(responseUnableToHash);
  }

  try {
    log.verbose({ msg: routeName('Request Body'), data: req.body });
    const [rows] = await db.registerUser(log, pool, req.body);
    if (!rows.affectedRows) {
      const rowCheck = errList.dbError.ERR_RESTAURANT_EMPLOYEE_CREATE_FATAL_AFFECTED_ROWS_0;
      return res.status(500).send(rowCheck);
    }
  } catch (e) {
    log.error({ msg: routeName(e.message), e });
    if (e.code === 'ER_DUP_ENTRY') {
      const duplicateEntry = errList.dbError.ERR_INSERT_RESTAURANT_EMPLOYEE_DUPLICATE_ENTRY;
      return res.status(500).send(duplicateEntry);
    }
    const responseUserNotExist = RG.dbError(errList.dbError.ERR_USER_LOGIN_USER_DOES_NOT_EXIST);
    return res.status(400).send(responseUserNotExist);
  }

  return res.status(200).send(
    RG.success('Register User', 'Register User successfully in the database!!!', [
      {
        name: req.body.name,
        email: req.body.email,
        mobile: req.body.mobile,
      },
    ]),
  );
});

module.exports = router;
