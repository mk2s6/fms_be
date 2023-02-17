const functionName = (str) => `execute-db-transactions ${str ? `| ${str}` : ''}`;

async function startTransaction(log, pool) {
  let conn;
  try {
    conn = await pool.getConnection();
  } catch (e) {
    log.error({ msg: functionName(`startTransaction - getConnection : Error : ${e.message}`), error: e });
    return Promise.reject('ERR_TRANSACTION_GET_CONNECTION_FAILURE');
  }

  // Begin Transaction
  try {
    await conn.beginTransaction();
  } catch (e) {
    log.error({ msg: functionName(`startTransaction - beginTransaction : Error : ${e.message}`), error: e });
    await rollbackTransaction(log, pool);
    return Promise.reject('ERR_TRANSACTION_BEGIN_TRANSACTION_FAILURE');
  }

  return conn;
}

async function commitTransaction(log, pool) {
  try {
    await pool.commit();
    await pool.release();
  } catch (e) {
    log.error({ msg: functionName(`commitTransaction : Error : ${e.message}`), error: e });
    await rollbackTransaction(log, pool);
    return Promise.reject('ERR_TRANSACTION_COMMIT_FAILURE');
  }
}

async function rollbackTransaction(log, pool) {
  log.info(functionName('rollbackTransaction | Execution Started'));
  try {
    await pool.rollback();
    await pool.release();
  } catch (e) {
    log.error({ msg: functionName(`rollbackTransaction : Error : ${e.message}`), error: e });
    return Promise.reject('ERR_TRANSACTION_ROLLBACK_FAILURE');
  }
}

module.exports.startTransaction = startTransaction;
module.exports.commitTransaction = commitTransaction;
module.exports.rollbackTransaction = rollbackTransaction;
