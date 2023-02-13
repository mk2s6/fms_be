/* eslint-disable arrow-parens */
const express = require('express');
const RG = require('../../model/response-generator');
const db = require('./db-app-modules');
const pool = require('../../database/db');
const { errList } = require('../../model/error');

const router = express.Router();
const routeName = (str) => `*** app-modules-list ${str ? `|| ${str}` : ''} ***`;

/**
 *
 * @api {GET} /app-modules/list Modules list for UI - Restaurant
 * @apiName Modules list for UI - Restaurant
 * @apiGroup Modules
 * @apiVersion 0.0.1
 * @apiPermission Employee who logged in can access the resource
 *
 * @apiHeader {String} x-id-token Employee login authentication token
 *
 * @apiSampleRequest /app-modules/list
 */
router.get('', async (req, res) => {
  const log = req.logger;
  log.info(routeName());
  try {
    const [modules] = await db.getModules(log, pool, !!(req.token && req.session));

    return res.status(200).send(RG.success('Application modules', 'Application modules retrieved successfully!!!', modules));
  } catch (e) {
    log.error(routeName(e.message), e);
    if (e.stack) return res.status(500).send(RG.internalError(errList.internalError.ERR_RESTAURANT_SELECT_LIST_FAILURE));
    return res.status(500).send(RG.internalError(e));
  }
});

module.exports = router;
