const express = require('express');
const { protectUserRoute } = require('../../model/auth');
const lendingsList = require('./lendings-list');
const lendingDetails = require('./lending-details');
const lendingAdd = require('./lending-add');
const lendingUpdate = require('./lending-update');
const lendingSettle = require('./lending-settle');
const lendingDelete = require('./lending-delete');
const addLendingTransaction = require('./lending-transaction-add');
const router = express.Router();

router.use('', protectUserRoute, lendingsList);
router.use('', protectUserRoute, lendingDetails);
router.use('', protectUserRoute, lendingAdd);
router.use('', protectUserRoute, lendingUpdate);
router.use('', protectUserRoute, addLendingTransaction);
router.use('', protectUserRoute, lendingDelete);
router.use('/settle', protectUserRoute, lendingSettle);

module.exports = router;
