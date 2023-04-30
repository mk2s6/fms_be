const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');

// eslint-disable-next-line arrow-parens
const functionName = (str) => `*** db-transactions ${str ? `| ${str}` : ''} ***`;

const TRANSACTION_MAX_UPDATE_TIMES = 5;

async function transactionsList(log, pool, user, filters) {
  log.info(functionName('transactionsList'));
  const responseData = [];
  const ORDER_BY = 'DESC';
  const { page_no, limit } = filters;

  try {
    let sqlSelectQuery = `
        SELECT
                trans_id AS id, trans_purpose AS purpose,
                trans_currency_code AS currencyCode, trans_type AS type, trans_category AS category,
                trans_value AS value, trans_mode AS mode, trans_made_on AS date
        FROM transactions
        WHERE trans_user_id = ? AND trans_is_deleted = ? `;

    let sqlCounterQuery = `
            SELECT count(*) AS count
            FROM transactions
        WHERE trans_user_id = ? AND trans_is_deleted = ? `;

    const sqlPaginationExtension = `
              ORDER BY trans_made_on ${ORDER_BY} LIMIT ? OFFSET ?
          `;

    const sqlParams = [user.id, 0];

    if (Object.keys(filters).length > 2) {
      let sqlFilterQuery = ` `;

      if ('ledger' in filters) {
        sqlFilterQuery += ` AND trans_ledger_id = ?`;
        sqlParams.push(filters.ledger);
      }

      if ('lending' in filters) {
        sqlFilterQuery += ` AND trans_lending_id = ?`;
        sqlParams.push(filters.lending);
      }

      if ('parent_transaction' in filters) {
        sqlFilterQuery += ` AND trans_parent_trans_id = ?`;
        sqlParams.push(filters.parent_transaction);
      }

      sqlSelectQuery += sqlFilterQuery;
      sqlCounterQuery += sqlFilterQuery;
      sqlParams.push(resType, resType, resStatus, resStatus);
    }

    try {
      [counter] = await pool.execute(sqlCounterQuery, sqlParams);
    } catch (e) {
      log.error({ err: e, msg: functionName(e.message) });
      return Promise.reject('ERR_PAGINATION_LIST_GET_NUMBER_OF_PAGES_FAILURE');
    }
    const totalPages = counter[0].count % limit === 0 ? parseInt(counter[0].count / limit, 10) : parseInt(counter[0].count / limit, 10) + 1;

    const lowValue = (page_no - 1) * limit;
    sqlSelectQuery += sqlPaginationExtension;
    sqlParams.push(parseInt(limit, 10), lowValue);

    try {
      const [rows] = await pool.query(sqlSelectQuery, sqlParams);
      responseData.push({
        totalPages,
        currentPage: parseInt(filters.page_no, 10),
        totalItems: counter[0].count,
        items: rows,
      });
    } catch (e) {
      log.error({ err: e, msg: functionName(e.message) });
      return Promise.reject('ERR_TRANSACTION_SELECT_LIST_FAILURE');
    }
  } catch (e) {
    log.error({ err: e, msg: functionName(e.message) });
    return Promise.reject('ERR_TRANSACTION_SELECT_LIST_FAILURE');
  }

  return responseData;
}

async function transactionDetails(log, pool, user, trans_id) {
  log.info(functionName('transactionDetails'));
  return pool.execute(
    `SELECT
        trans_id AS id, trans_purpose AS purpose, trans_category AS category,
        trans_description AS description, trans_currency_code AS currencyCode, trans_type AS type,
        trans_value AS value, trans_mode AS mode, trans_made_on AS date
   FROM transactions
   WHERE trans_id = ? AND trans_user_id = ? AND trans_is_deleted = ?;`,
    [trans_id, user.id, 0],
  );
}

async function addTransaction(
  log,
  pool,
  user,
  { paymentMethod, purpose, description, category, currencyCode, type, amount, mode, date, refNumber, ...transaction },
) {
  log.info(functionName('addTransaction'));

  return pool.execute(
    `INSERT INTO transactions (
          trans_user_id, trans_ledger_id, trans_lending_id, trans_parent_trans_id, trans_purpose,
          trans_description, trans_category, trans_currency_code, trans_type, trans_value,
          trans_mode, trans_made_on, trans_ref_number, trans_payment_method
        )
      VALUES (
          ?, ?, ?, ?, ?,
          ?, ?, ?, ?, ?,
          ?, ?, ?, ?
        );`,
    [
      user.id,
      transaction.ledgerId || null,
      transaction.lendingId || null,
      transaction.parentTransaction || null,
      purpose,
      description,
      category,
      currencyCode,
      type,
      amount,
      mode,
      date.replace('T', ' ').replace('Z', ''),
      refNumber || null,
      paymentMethod || null,
    ],
  );
}

async function transactionUpdateStatus(log, pool, user, trans_id) {
  log.info(functionName('transactionUpdateStatus'));
  const [counts] = await pool.execute(
    `
      SELECT COUNT(*) AS transactionCount
      FROM transactions
      WHERE trans_id = ? AND trans_user_id = ? AND trans_is_deleted = ? AND trans_updated < ?;`,
    [trans_id, user.id, 0, TRANSACTION_MAX_UPDATE_TIMES],
  );
  if (counts[0].transactionCount !== 1) {
    log.error({ msg: 'Transaction can not be updated' });
    const generateToken = RG.dbError(errList.dbError.ERR_TRANSACTION_CAN_NOT_BE_UPDATED);
    throw generateToken;
  }

  return true;
}

async function updateTransaction(log, pool, user, { id, purpose, description, category, currencyCode, type, amount, mode, date, ...transaction }) {
  log.info(functionName('updateTransaction'));
  return pool.execute(
    ` UPDATE transactions
      SET
          trans_ledger_id = ?, trans_parent_trans_id = ?, trans_purpose = ?, trans_description = ?,
          trans_category = ?, trans_currency_code = ?, trans_type = ?, trans_value = ?,
          trans_mode = ?, trans_made_on = ?, trans_updated = trans_updated + 1
      WHERE trans_id = ? AND trans_user_id = ? AND trans_is_deleted = ? AND trans_updated < ?;
      `,
    [
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
      id,
      user.id,
      0,
      TRANSACTION_MAX_UPDATE_TIMES,
    ],
  );
}

async function transactionDeleteStatus(log, pool, user, trans_id) {
  log.info(functionName('transactionDeleteStatus'));
  const [counts] = await pool.execute(
    `
      SELECT COUNT(*) AS transactionCount
      FROM transactions
      WHERE trans_id = ? AND trans_user_id = ? AND trans_is_deleted = ?;`,
    [trans_id, user.id, 0],
  );
  if (counts[0].transactionCount !== 1) {
    log.error({
      msg: functionName('Transaction can not be updated'),
    });
    const generateToken = RG.dbError(errList.dbError.ERR_TRANSACTION_CAN_NOT_BE_DELETED);
    throw generateToken;
  }

  return true;
}

async function deleteTransaction(log, pool, user, id) {
  log.info(functionName('deleteTransaction'));
  return pool.execute(
    ` UPDATE transactions
      SET trans_is_deleted = ?
      WHERE trans_id = ? AND trans_user_id = ? AND trans_is_deleted = ?;
      `,
    [1, id, user.id, 0],
  );
}

async function deleteLendingTransactions(log, pool, user, id) {
  log.info(functionName('deleteLendingTransactions'));
  return pool.execute(
    ` UPDATE transactions
      SET trans_is_deleted = ?
      WHERE trans_lending_id = ? AND trans_user_id = ? AND trans_is_deleted = ?;
      `,
    [1, id, user.id, 0],
  );
}

module.exports = {
  deleteTransaction,
  transactionsList,
  transactionDetails,
  addTransaction,
  transactionUpdateStatus,
  updateTransaction,
  transactionDeleteStatus,
  deleteLendingTransactions,
};
