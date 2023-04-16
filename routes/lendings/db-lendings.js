// eslint-disable-next-line arrow-parens
const functionName = (str) => `*** db-lendings ${str ? `| ${str}` : ''} ***`;

async function lendingsList(log, pool, user, filters) {
  log.info(functionName('lendingsList'));
  const ORDER_BY = 'DESC';

  let sqlSelectQuery = `
      SELECT
        credit_id AS id, credit_to_name AS toName, credit_currency AS currencyCode,
        credit_amount AS amount, credit_on_date AS madeOn, credit_is_borrowed AS borrowingStatus,
        credit_is_settled AS settlementStatus
      FROM credit
      WHERE credit_user_id = ? AND credit_is_deleted = ? `;
  const sqlParams = [user.id, 0];

  if (Object.keys(filters).length) {
    if ('settled' in filters) {
      sqlSelectQuery += ` AND credit_is_settled = ? `;
      sqlParams.push(filters.settled);
    }
  }

  sqlSelectQuery = `${sqlSelectQuery} ORDER BY credit_on_date ${ORDER_BY}`;

  return pool.execute(sqlSelectQuery, sqlParams);
}

async function lendingDetails(log, pool, user, lendingId) {
  log.info(functionName('lendingDetails'));
  return pool.execute(
    `SELECT
          credit_id AS id, credit_to_name AS toName, credit_purpose AS purpose, credit_details AS details,
          credit_to_email AS toEmail, credit_to_phone AS toPhone, credit_currency AS currencyCode, credit_amount AS amount,
          credit_on_date AS onDate, credit_is_borrowed AS borrowingStatus, credit_is_settled AS settlementStatus,
          credit_category AS category, credit_mode AS mode,
          credit_notifications AS notificationSettings
        FROM credit
        WHERE credit_id = ? AND credit_user_id = ? AND credit_is_deleted = ?;`,
    [lendingId, user.id, 0],
  );
}

async function addLending(
  log,
  pool,
  user,
  { ledger, purpose, details, category, toName, toEmail, toPhone, currencyCode, amount, onDate, isBorrowed, mode },
) {
  log.info(functionName('addLending'));

  return pool.execute(
    `INSERT INTO credit (
          credit_user_id, credit_ledger_id, credit_purpose, credit_details, credit_category,
          credit_to_name, credit_to_email, credit_to_phone, credit_currency, credit_amount,
          credit_on_date, credit_is_borrowed, credit_mode
        )
      VALUES (
          ?, ?, ?, ?, ?,
          ?, ?, ?, ?, ?,
          ?, ?, ?
      );`,
    [
      user.id,
      ledger || null,
      purpose,
      details,
      category,
      toName,
      toEmail || null,
      toPhone || null,
      currencyCode,
      amount,
      onDate.replace('T', ' ').replace('Z', ''),
      isBorrowed,
      mode,
    ],
  );
}

module.exports = { lendingsList, lendingDetails, addLending };
