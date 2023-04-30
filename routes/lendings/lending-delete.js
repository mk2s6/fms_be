const express = require('express');
const db = { ...require('./db-lendings'), ...require('../transactions/db-transactions') };
const pool = require('../../database/db');
const { startTransaction, rollbackTransaction, commitTransaction } = require('../../model/execute-db-transactions');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');
const { addLending, paramLendingIdValidation } = require('./validations');
const { getCurrentDateTime } = require('../../utils/dates');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** lending-delete ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} /lendings lending settle
 * @apiName lending settle
 * @apiGroup lending
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiSampleRequest /lendings
 */
router.delete('/:id', paramLendingIdValidation, async (req, res, next) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  let T;
  try {
    T = await startTransaction(log, pool);

    await db.deleteLending(log, T, req.user, req.params.id);

    // Delete transactions for lending
    await db.deleteLendingTransactions(log, T, req.user, req.params.id);

    await commitTransaction(log, T);
    return RG.respondSuccess(res)('lending delete', 'lending deleted Successfully.!!!', []);
  } catch (e) {
    log.error({ msg: e, location: routeName('Error') });
    T && (await rollbackTransaction(log, T));
    if (e instanceof RG.APIError) {
      return next(e);
    }
    return next(new RG.APIError(1, 'ERR_INTERNAL_SERVER_ERROR'));
  }
});

module.exports = router;
