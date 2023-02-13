const express = require('express');
const { protectUserRoute } = require('../../model/auth');
const transactionsList = require('./ledgers-list');
const router = express.Router();

router.use('', protectUserRoute, transactionsList);

module.exports = router;
