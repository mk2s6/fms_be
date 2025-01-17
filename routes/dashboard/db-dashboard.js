const pool = require('../../database/db');

const functionName = (str) => `*** db-dashboard ${str ? `| ${str}` : ''} ***`;

async function transactionSummaryMonthly(log, user, filters) {
  log.info(functionName(' transactionSummaryMonthly'));
  const { months } = filters;
  return pool.execute(
    `
      SELECT
        DATE_FORMAT(trans_made_on, "%Y-%m") AS month,
        count(*) AS transactionsCount,
        SUM(CASE WHEN trans_type = 'CREDIT' THEN 1 ELSE 0 END) AS creditsCount,
        SUM(CASE WHEN trans_type = 'DEBIT' THEN 1 ELSE 0 END) AS debitsCount,
        SUM(CASE WHEN trans_type = 'CREDIT' THEN trans_value ELSE 0 END) AS credits,
        SUM(CASE WHEN trans_type = 'DEBIT' THEN trans_value ELSE 0 END) AS debits
      FROM transactions
      where trans_user_id = ? AND trans_made_on >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL ? MONTH), '%Y-%m-01') AND trans_is_deleted = 0
      GROUP BY 1;
    `,
    [user.id, months || 0],
  );
}

module.exports = {
  transactionSummaryMonthly,
};
