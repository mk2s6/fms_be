const express = require('express');
const vs = require('../../model/validator-sanitizer');
const responseGenerator = require('../../model/response-generator');
const db = require('./db-common-assets');
const error = require('../../model/error');

const router = express.Router();

// eslint-disable-next-line arrow-parens
const routeName = (str) => `*** refresh-geographical-data ${str ? `|| ${str}` : ''}***`;

router.get('/', async (req, res) => {
  const log = req.logger;
  log.info(routeName());
  try {
    await db.populateGeoGraphicData();
    return res.status(200).send(responseGenerator.success('Geographical data', 'Geographical data retrieved successfully!!!', []));
  } catch (e) {
    log.error({ msg: routeName(e.message), error: e });
    const resErrorInInsert = responseGenerator.internalError(error.errList.internalError.ERR_SELECT_COUNTRY_LIST_FAILURE);
    return res.status(500).send(resErrorInInsert);
  }
});

module.exports = router;
