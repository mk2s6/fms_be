// eslint-disable-next-line arrow-parens
const functionName = (str) => `*** db-ledgers ${str ? `| ${str}` : ''} ***`;

async function ledgersList(log, pool, user, filters) {
  log.info(functionName('ledgersList'));
  const ORDER_BY = 'ASC';
  return pool.execute(
    `SELECT
        led_id AS id, led_name AS name, led_categories AS category
   FROM ledgers WHERE led_user_id = ? AND led_is_deleted = ?
   ORDER BY led_name ${ORDER_BY};`,
    [user.id, 0],
  );
}

async function ledgerDetails(log, pool, user, ledger_id) {
  log.info(functionName('ledgerDetails'));
  return pool.execute(
    `SELECT
        led_id AS id, led_name AS name, led_details AS details, led_purpose AS purpose, led_categories AS category,
        led_status AS status, led_total_debits AS totalDebits, led_total_credits AS totalCredits
   FROM ledgers WHERE led_id = ? AND led_user_id = ? AND led_is_deleted = ?;`,
    [ledger_id, user.id, 0],
  );
}

async function addLedger(log, pool, user, { name, purpose, description, category }) {
  console.log(this);
  log.info(functionName('addLedger'));
  return pool.execute(
    `INSERT INTO ledgers (
          led_user_id, led_name, led_details, led_purpose, led_categories
        )
      VALUES (
          ?, ?, ?, ?, ?
        );`,
    [user.id, name, purpose, description, category],
  );
}

async function updateLedger(log, pool, user, { id, name, purpose, description, category }) {
  log.info(functionName('updateLedger'));
  return pool.execute(
    `
      UPDATE ledgers
      SET led_name = ?, led_details = ?, led_purpose = ?, led_categories = ?
      WHERE led_id = ? AND led_user_id = ?;
      `,
    [name, purpose, description, category, id, user.id],
  );
}

async function deleteLedger(log, pool, user, id) {
  log.info(functionName('deleteLedger'));
  return pool.execute(
    `
      UPDATE ledgers
      SET led_is_deleted = ?
      WHERE led_id = ? AND led_user_id = ? AND led_is_deleted = ?;
      `,
    [1, id, user.id, 0],
  );
}

module.exports = { ledgersList, ledgerDetails, addLedger, updateLedger, deleteLedger };
