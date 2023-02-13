const express = require('express');
const RG = require('../../model/response-generator');
const { errList } = require('../../model/error');
const { updateSessionLogout } = require('../auth/db-auth');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** employees-logout ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} employees/logout Employee logout
 * @apiName Employee logout
 * @apiGroup Employees
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiBody {String} username=siva.kusi username of an employee can be username, email or mobile
 * @apiBody {String} password=b8mX1AK$ password of the employee to logout
 * @apiBody {Boolean} rememberMe=false password of the employee to logout
 *
 * @apiSampleRequest /employees/logout
 */
router.post('', async (req, res) => {
  const log = req.logger;
  log.info(routeName());

  req.session.uss_session_details.push({ message: 'User signout' });

  const sessionObject = {
    comments: JSON.stringify(req.session.uss_session_details),
    time: new Date().toISOString().replace('T', ' ').replace('Z', ''),
    id: req.session.uss_id,
  };

  try {
    [UpdateSessionDetails] = await updateSessionLogout(sessionObject);
  } catch (e) {
    log.error(routeName(e.message), { error: e });
    const responseExceptionInSelect = RG.internalError(errList.internalError.ERR_LOGIN_SELECT_THROW_EXCEPTION);
    return res.status(500).send(responseExceptionInSelect);
  }

  return res.status(200).send(RG.success('Employee logout', 'Logout Successful!!!', []));
});

module.exports = router;
