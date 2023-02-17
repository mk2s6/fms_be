// eslint-disable-next-line arrow-parens
const functionName = (str) => `*** db-lendings ${str ? `| ${str}` : ''} ***`;

async function lendingsList(log, pool, user, filters) {
  log.info(functionName('lendingsList'));
  const ORDER_BY = 'DESC';
  return pool.execute(
    `SELECT
        lend_id AS id, lend_to_name AS toName, lend_currency AS currencyCode,
        lend_amount AS amount, lend_on_date AS madeOn, lend_is_borrowed AS borrowingStatus,
        lend_is_settled AS settlementStatus
      FROM lendings
      WHERE lend_user_id = ? AND lend_is_deleted = ?
      ORDER BY lend_on_date ${ORDER_BY};`,
    [user.id, 0],
  );
}

async function lendingDetails(log, pool, user, lendingId) {
  log.info(functionName('lendingDetails'));
  return pool.execute(
    `SELECT
          lend_id AS id, lend_user_id AS userId, lend_to_name AS toName,
          lend_to_email AS toEmail, lend_to_phone AS toPhone, lend_currency AS currencyCode, lend_amount AS amount,
          lend_on_date AS onDate, lend_is_borrowed AS borrowingStatus, lend_is_settled AS settlementStatus,
          lend_notifications AS notificationSettings
        FROM lendings
        WHERE lend_id = ? AND lend_user_id = ? AND lend_is_deleted = ?;`,
    [lendingId, user.id, 0],
  );
}

async function addLending(
  log,
  pool,
  user,
  { ledger, purpose, details, category, toName, toEmail, toPhone, currencyCode, amount, onDate, isBorrowed },
) {
  log.info(functionName('addLending'));

  return pool.execute(
    `INSERT INTO lendings (
          lend_user_id, lend_ledger_id, lend_purpose, lend_details, lend_category,
          lend_to_name, lend_to_email, lend_to_phone, lend_currency, lend_amount,
          lend_on_date, lend_is_borrowed
        )
      VALUES (
          ?, ?, ?, ?, ?,
          ?, ?, ?, ?, ?,
          ?, ?
      );`,
    [user.id, ledger || null, purpose, details, category, toName, toEmail || null, toPhone || null, currencyCode, amount, onDate, isBorrowed],
  );
}

module.exports = { lendingsList, lendingDetails, addLending };
