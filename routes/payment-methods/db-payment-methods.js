// eslint-disable-next-line arrow-parens
const functionName = (str) => `*** db-payment-methods ${str ? `| ${str}` : ''} ***`;

async function paymentMethodsList(log, pool, user, filters) {
  log.info(functionName('paymentMethodsList'));
  const ORDER_BY = 'ASC';

  return pool.execute(
    `SELECT
          pm_id AS id, pm_type AS type, pm_name AS name, pm_last_4_digits AS last4Digits,
          pm_is_active AS active, pm_is_deleted AS isDeleted
      FROM payment_methods
      WHERE pm_user_id = ? and pm_is_deleted != ?
      ORDER BY pm_type ${ORDER_BY}, pm_name ${ORDER_BY};`,
    [user.id, true],
  );
}

async function paymentMethodDetails(log, pool, user, paymentMethodId) {
  log.info(functionName('paymentMethodDetails'));
  return pool.execute(
    `SELECT
          pm_id AS id, pm_type AS type, pm_name AS name, pm_last_4_digits AS last4Digits,
          pm_is_active AS active, pm_is_deleted AS isDeleted
        FROM payment_methods
        WHERE pm_id = ? AND pm_user_id = ? AND pm_is_deleted = ?;`,
    [paymentMethodId, user.id, 0],
  );
}

async function addPaymentMethod(log, pool, user, { name, type, last4Digits }) {
  log.info(functionName('addPaymentMethod'));

  return pool.execute(
    `INSERT INTO payment_methods (
          pm_user_id, pm_name, pm_type, pm_last_4_digits
        )
      VALUES ( ?, ?, ?, ? );`,
    [user.id, name, type, last4Digits],
  );
}

async function updatePaymentMethod(log, pool, user, { name, type, last4Digits, id }) {
  log.info(functionName('updatePaymentMethod'));

  return pool.execute(
    `UPDATE payment_methods SET pm_name = ?, pm_type = ?, pm_last_4_digits = ?
     WHERE pm_id = ? AND pm_user_id = ?`,
    [name, type, last4Digits, id, user.id],
  );
}

async function togglePaymentMethodStatus(log, pool, user, status, id) {
  log.info(functionName('togglePaymentMethodStatus'));

  return pool.execute(
    `UPDATE payment_methods SET pm_is_active = ?
     WHERE pm_id = ? AND pm_user_id = ?`,
    [status, id, user.id],
  );
}

async function deletePaymentMethod(log, pool, user, id) {
  log.info(functionName('deletePaymentMethod'));

  return pool.execute(
    `
      UPDATE payment_methods
      SET pm_is_active = ?, pm_is_deleted = ?
      WHERE pm_id = ? AND pm_user_id = ?`,
    [false, true, id, user.id],
  );
}

module.exports = { paymentMethodsList, paymentMethodDetails, addPaymentMethod, updatePaymentMethod, togglePaymentMethodStatus, deletePaymentMethod };
