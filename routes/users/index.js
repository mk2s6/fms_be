const express = require('express');
const login = require('./user-login');
const logout = require('./user-logout');
const profile = require('./user-profile');
const userRegister = require('./user-register');
const userUsernameCheck = require('./user-check-username');
const userSetPassword = require('./user-change-password');
const userSetUsername = require('./user-set-username');
const { protectUserRoute } = require('../../model/auth');

const router = express.Router();

router.use('/login', login);
router.use('/register', userRegister);
router.use('/logout', protectUserRoute, logout);
router.use('/my/profile', protectUserRoute, profile);
router.use('/username', protectUserRoute, userUsernameCheck);
router.use('/my/password', protectUserRoute, userSetPassword);
router.use('/my/username', protectUserRoute, userSetUsername);

module.exports = router;
