/* eslint-disable linebreak-style */
const express = require('express');
const { protectUserRoute } = require('../../model/auth');

const list = require('./app-modules-list');

const router = express.Router();

router.use('', list);

module.exports = router;
