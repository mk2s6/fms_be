// eslint-disable-next-line arrow-parens
const functionName = (str) => `*** db-transactions ${str ? `| ${str}` : ''} ***`;

async function transactionsList(log, pool, user, filters) {
  log.info(functionName('transactionsList'));
  const ORDER_BY = 'DESC';
  return pool.execute(
    `SELECT
                trans_id AS id, trans_user_id AS userId, trans_purpose AS transactionPurpose,
                trans_description AS transactionDescription, trans_currency_code AS currencyCode, trans_type AS transactionType,
                trans_value AS transactionValue, trans_mode AS transactionModes, trans_made_on AS transactionDate
   FROM transactions WHERE trans_user_id = ? AND trans_is_deleted = ?
   ORDER BY trans_made_on ${ORDER_BY};`,
    [user.id, 0],
  );
}

async function transactionDetails(log, pool, user, trans_id) {
  log.info(functionName('transactionDetails'));
  return pool.execute(
    `SELECT
                trans_id AS id, trans_user_id AS userId, trans_purpose AS transactionPurpose,
                trans_description AS transactionDescription, trans_currency_code AS currencyCode, trans_type AS transactionType,
                trans_value AS transactionValue, trans_mode AS transactionModes, trans_made_on AS transactionDate
   FROM transactions WHERE trans_id = ? AND trans_user_id = ? AND trans_is_deleted = ?;`,
    [trans_id, user.id, 0],
  );
}

async function transactionDetails(log, pool, user, trans_id) {
  log.info(functionName('transactionDetails'));
  return pool.execute(
    `SELECT
                trans_id AS id, trans_user_id AS userId, trans_purpose AS transactionPurpose,
                trans_description AS transactionDescription, trans_currency_code AS currencyCode, trans_type AS transactionType,
                trans_value AS transactionValue, trans_mode AS transactionModes, trans_made_on AS transactionDate
   FROM transactions WHERE trans_id = ? AND trans_user_id = ? AND trans_is_deleted = ?;`,
    [trans_id, user.id, 0],
  );
}

async function addTransaction(log, pool, user, { purpose, description, category, currencyCode, type, amount, mode, date, ...transaction }) {
  log.info(functionName('addTransaction'));
  return pool.execute(
    `INSERT INTO transactions (
          trans_user_id, trans_ledger_id, trans_parent_trans_id, trans_purpose,
          trans_description, trans_category, trans_currency_code, trans_type, trans_value,
          trans_mode, trans_made_on
        )
      VALUES (
          ?, ?, ?, ?,
          ?, ?, ?, ?, ?,
          ?, ?
        );`,
    [
      user.id,
      transaction.ledgerId || null,
      transaction.parentTransaction || null,
      purpose,
      description,
      category,
      currencyCode,
      type,
      amount,
      mode,
      date,
    ],
  );
}

module.exports = { transactionsList, transactionDetails, addTransaction };
