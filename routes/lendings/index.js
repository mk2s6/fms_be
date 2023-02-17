const express = require('express');
const { protectUserRoute } = require('../../model/auth');
const lendingsList = require('./lendings-list');
const lendingDetails = require('./lending-details');
const lendingAdd = require('./lending-add');
const addLendingTransaction = require('./lending-transaction-add');
const router = express.Router();

router.use('', protectUserRoute, lendingsList);
router.use('', protectUserRoute, lendingDetails);
router.use('', protectUserRoute, lendingAdd);
router.use('', protectUserRoute, addLendingTransaction);

module.exports = router;
