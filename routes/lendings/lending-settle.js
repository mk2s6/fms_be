const express = require('express');
const db = { ...require('./db-lendings'), ...require('../transactions/db-transactions') };
const pool = require('../../database/db');
const { startTransaction, rollbackTransaction, commitTransaction } = require('../../model/execute-db-transactions');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');
const { addLending, paramLendingIdValidation } = require('./validations');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** lending-update ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {POST} /lendings lending update
 * @apiName lending update
 * @apiGroup lending
 * @apiVersion 0.0.1
 * @apiPermission none
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiSampleRequest /lendings
 */
router.put('/:id', addLending, paramLendingIdValidation, async (req, res, next) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));

  try {
    const [rows] = await db.settleLending(log, pool, req.user, req.params);

    return RG.respondSuccess(res)('lending update', 'lending updated Successfully.!!!', rows);
  } catch (e) {
    log.error({ msg: e, location: routeName('Error') });
    if (e instanceof RG.APIError) {
      return next(e);
    }
    return next(new RG.APIError(1, ERR_INTERNAL_SERVER_ERROR));
  }
});

module.exports = router;
