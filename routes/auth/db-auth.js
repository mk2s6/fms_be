const pool = require('../../database/db');
const { getUserDetailsByIdForAuth } = require('../users/db-users');

// eslint-disable-next-line arrow-parens
const functionName = (str) => `*** db-auth ${str ? `|| ${str} ` : ''}***`;

const getDetailsForAuth = async (log, { id, resId }) => {
  log.info(functionName('getDetailsForAuth'));
  let detailsForAuth = { rolePermissions: null };

  try {
    [empDetails] = await getUserDetailsByIdForAuth(log, pool, { id, resId });
    // eslint-disable-next-line prefer-destructuring
    detailsForAuth = { ...detailsForAuth, ...empDetails[0] };
  } catch (e) {
    log.error(functionName(e.message), { error: e });
    return Promise.reject(e);
  }

  return detailsForAuth;
};

async function getSessionDetails(sessionId) {
  return await pool.execute('SELECT * FROM user_sessions WHERE uss_session_id = ?', [sessionId]);
}

async function getSessionDetailsById(id) {
  return await pool.execute('SELECT * FROM user_sessions WHERE uss_id = ?', [id]);
}

async function insertSessionDetails({ jwt, validity, host, ip }) {
  return await pool.execute(
    `
  INSERT INTO user_sessions
         (uss_token, uss_token_valid_till, uss_request_host, uss_session_ip)
  VALUES (?, ?, ?, ?)`,
    [jwt, validity, host, ip],
  );
}

async function updateSessionDetails({ jwt, time, comments, id }) {
  return await pool.execute(
    `
  UPDATE user_sessions
  SET uss_token = ?, uss_login_request_update_time = ?, uss_session_details = ?
  WHERE uss_id = ?`,
    [jwt, time, comments, id],
  );
}

async function updateSessionLogout({ time, comments, id }) {
  return await pool.execute(
    `
  UPDATE user_sessions
  SET uss_user_signout = ?, uss_login_request_update_time = ?, uss_session_details = ?
  WHERE uss_id = ?`,
    [1, time, comments, id],
  );
}

module.exports = { getDetailsForAuth, getSessionDetails, insertSessionDetails, getSessionDetailsById, updateSessionDetails, updateSessionLogout };
