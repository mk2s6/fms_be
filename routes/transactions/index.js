const express = require('express');
const { protectUserRoute } = require('../../model/auth');
const transactionsList = require('./transactions-list');
const transactionAdd = require('./transaction-add');
const transactionUpdate = require('./transaction-update');
const transactionDelete = require('./transaction-delete');
const transactionDetails = require('./transactions-details');
const router = express.Router();

router.use('', protectUserRoute, transactionsList);
router.use('', protectUserRoute, transactionAdd);
router.use('', protectUserRoute, transactionDelete);
router.use('', protectUserRoute, transactionUpdate);
router.use('', protectUserRoute, transactionDetails);

module.exports = router;
