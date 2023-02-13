const hf = require('../../model/helper-function');

// eslint-disable-next-line arrow-parens
const functionName = (str) => `*** db-users ${str ? `| ${str}` : ''} ***`;

const getUserDetailsForLogin = async (log, pool, { username }) => {
  log.info({ msg: functionName('getUserDetailsForLogin') });

  let sqlQuery = `SELECT
                user_id AS id, user_code AS code, user_name AS name, user_password AS password
                FROM users `;

  const sqlParams = [];

  if (hf.isEmail(username)) {
    sqlQuery += ' WHERE user_email = ? ';
  } else if (hf.isMobile(username)) {
    sqlQuery += ' WHERE user_mobile = ? ';
  } else {
    sqlQuery += ' WHERE UPPER(user_code) = UPPER(?) ';
  }

  sqlQuery += ' AND user_is_active = 1 AND user_is_deleted = 0';

  sqlParams.push(username);

  return pool.execute(sqlQuery, sqlParams);
};

const getUserDetailsByIdForAuth = async (log, pool, { resId, id }) => {
  log.info({ msg: functionName('getUserDetailsByIdForAuth') });

  const sqlQuery = `SELECT
                user_id AS id, user_code AS code, user_name AS name, user_email_verified AS emailVerified
                FROM users WHERE user_id = ?;`;

  const sqlParams = [id];

  return pool.execute(sqlQuery, sqlParams);
};

const getUserProfileDetails = async (log, pool, { id }) => {
  log.info({ msg: functionName('getUserProfileDetails') });
  const sqlQuery = `SELECT
                user_code AS id, user_name AS name,
                user_code AS username, user_email AS email, user_mobile as mobile
                FROM users WHERE user_id = ?;`;
  const sqlParams = [id];

  return pool.execute(sqlQuery, sqlParams);
};

const checkUsername = async (log, pool, { username }, { id, resId }) => {
  log.info({ msg: functionName('checkUsername') });
  const sqlQuery = `
            SELECT count(*) AS count FROM users
            WHERE user_id != ? AND UPPER(user_code) = UPPER(?);
          `;
  const sqlParams = [id, username];

  return pool.execute(sqlQuery, sqlParams);
};

const registerUser = async (log, pool, user) => {
  log.info({ msg: functionName('registerUser'), data: user });
  const sqlQuery = `
              INSERT INTO users ( user_name, user_email, user_mobile, user_code, user_password )
              VALUES ( ?, ?, ?, ?, ? )
          `;
  const sqlParams = [user.name, user.email, user.mobile, user.username, user.password];

  return pool.execute(sqlQuery, sqlParams);
};

const setUserPassword = async (log, pool, { id, resId }, password) => {
  log.info({ msg: functionName('setUserPassword') });
  return pool.execute('UPDATE users SET user_password = ? WHERE user_id = ? AND user_res_id = ?;', [password, id, resId]);
};

const validateUserPin = async (log, pool, { id, resId }) => {
  log.info({ msg: functionName('validateUserPin') });
  return pool.execute('SELECT user_lock_pin AS PIN FROM users WHERE user_id = ? AND user_res_id = ?;', [id, resId]);
};

const setUserUsername = async (log, pool, { id }, { username }) => {
  log.info({ msg: functionName('setUserUsername') });
  return pool.execute('UPDATE users SET user_code = ? WHERE user_id = ? ;', [username, id]);
};

module.exports = {
  getUserDetailsForLogin,
  getUserDetailsByIdForAuth,
  getUserProfileDetails,
  registerUser,
  checkUsername,
  setUserPassword,
  validateUserPin,
  setUserUsername,
};
