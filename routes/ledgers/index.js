const express = require('express');
const { protectUserRoute } = require('../../model/auth');
const ledgerList = require('./ledgers-list');
const ledgerDetails = require('./ledgers-details');
const ledgerUpdate = require('./ledger-update');
const ledgerAdd = require('./ledger-add');
const ledgerAddTransaction = require('./ledger-transaction-add');
const router = express.Router();

router.use('', protectUserRoute, ledgerList);
router.use('', protectUserRoute, ledgerDetails);
router.use('', protectUserRoute, ledgerAdd);
router.use('', protectUserRoute, ledgerUpdate);
router.use('', protectUserRoute, ledgerAddTransaction);

module.exports = router;
