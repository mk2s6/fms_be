/* eslint-disable linebreak-style */
const express = require('express');
const commonRoutes = require('./common-assets');
const usersRoutes = require('./users');
const appModules = require('./modules');
const transactionModule = require('./transactions');
const ledgerModule = require('./ledgers');
const lendingModule = require('./lendings');
const paymentMethodsModule = require('./payment-methods');
const dashboardModule = require('./dashboard');

const router = express.Router();

router.use('/test', require('./index'));

/**
 * This is the code that is serving the common files to the client.
 */
router.use('/assets/commons', commonRoutes);
router.use('/users', usersRoutes);
router.use('/app/modules', appModules);
router.use('/transactions', transactionModule);
router.use('/ledgers', ledgerModule);
router.use('/lendings', lendingModule);
router.use('/payment-methods', paymentMethodsModule);
router.use('/dashboard', dashboardModule);

module.exports = router;
