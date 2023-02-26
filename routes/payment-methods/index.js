const express = require('express');
const { protectUserRoute } = require('../../model/auth');
const paymentMethodsList = require('./payment-methods-list');
const paymentMethodDetails = require('./payment-method-details');
const paymentMethodAdd = require('./payment-methods-add');
const router = express.Router();

router.use('', protectUserRoute, paymentMethodsList);
router.use('', protectUserRoute, paymentMethodDetails);
router.use('', protectUserRoute, paymentMethodAdd);

module.exports = router;
