// eslint-disable-next-line arrow-parens
const functionName = (str) => `*** db-ledgers ${str ? `| ${str}` : ''} ***`;

async function ledgersList(log, pool, user, filters) {
  log.info(functionName('ledgersList'));
  const ORDER_BY = 'ASC';
  return pool.execute(
    `SELECT
        led_id AS id, led_name AS name, led_category AS category
   FROM ledgers WHERE led_user_id = ? AND led_is_deleted = ?
   ORDER BY led_name ${ORDER_BY};`,
    [user.id, 0],
  );
}

async function ledgerDetails(log, pool, user, trans_id) {
  log.info(functionName('ledgerDetails'));
  return pool.execute(
    `SELECT
        led_id AS id, led_name AS name, led_details AS details, led_purpose AS purpose, led_category AS category
   FROM ledgers WHERE trans_id = ? AND trans_user_id = ? AND trans_is_deleted = ?;`,
    [trans_id, user.id, 0],
  );
}

module.exports = { ledgersList, ledgerDetails };
