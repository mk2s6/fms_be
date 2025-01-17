const express = require('express');
const { protectUserRoute } = require('../../model/auth');
const transactionSummary = require('./transaction-summary');
const router = express.Router();

router.use('', protectUserRoute, transactionSummary);

module.exports = router;
