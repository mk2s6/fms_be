/* eslint-disable linebreak-style */
const express = require('express');
const commonRoutes = require('./common-assets');
const usersRoutes = require('./users');
const appModules = require('./modules');
const transactionModule = require('./transactions');
const ledgerModule = require('./ledgers');
const lendingModule = require('./lendings');

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

module.exports = router;
