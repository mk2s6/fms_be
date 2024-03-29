/* eslint-disable linebreak-style */
const express = require('express');
const citySelect = require('./city-select');
const countrySelect = require('./country-select');
const stateSelect = require('./state-select');
const currencyCodesSelect = require('./currency-codes-select');
const AllCurrencyCodesSelect = require('./all-currency-codes-select');
const paymentModes = require('./payment-modes');
const transactionCategories = require('./transaction-categories');
// const refreshGeo = require('./refresh-geographical-data')

const router = express.Router();

router.use('/countries', countrySelect);
router.use('/states', stateSelect);
router.use('/cities', citySelect);
router.use('/currency-codes/all', AllCurrencyCodesSelect);
router.use('/currency-codes', currencyCodesSelect);
router.use('/transaction-modes', paymentModes);
router.use('/transaction-categories', transactionCategories);
// router.use('/refresh-geographical-data', refreshGeo);

module.exports = router;
