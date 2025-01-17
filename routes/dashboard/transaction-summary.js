const express = require('express');
const db = require('./db-dashboard');
const { errList } = require('../../model/error');
const RG = require('../../model/response-generator');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** ledgers-list ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {GET}  /dashboard/summary/:level Dashboard Transaction summary
 * @apiName Get Transaction summary at monthly level
 * @apiGroup Dashboard
 * @apiVersion 0.0.1
 * @apiPermission user-needed-to-login
 *
 * @apiParam {String} level Monthly/Weekly/Daily
 *
 * @apiSampleRequest /dashboard/summary/monthly
 */
router.get('/summary/:level', async (req, res) => {
  const log = req.logger;
  log.info(routeName('Execution Started'));
  try {
    let rows;
    switch (req.params.level) {
      default:
        [rows] = await db.transactionSummaryMonthly(log, req.user, req.query);
    }
    return res.status(200).send(RG.success('Ledgers list', 'Ledgers list Successfully retrieved!!!', rows));
  } catch (e) {
    log.error({ msg: routeName('Error'), err: e });
    const generateToken = RG.internalError(errList.internalError.ERR_LOGIN_TOKEN_GENERATION_ERROR);
    return res.status(400).send(generateToken);
  }
});

module.exports = router;
