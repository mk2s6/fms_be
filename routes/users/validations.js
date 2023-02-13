const vs = require('../../model/validator-sanitizer');
const constant = require('../../model/constant');
const VALIDATIONS_FOR = 'Employee Validations';

const registerValidations = [
  vs.isValidStrLenWithTrim('body', 'name', 3, 100, 'Please provide valid User name'),
  vs.isEmail('body', 'email'),
  vs.isMobile('body', 'mobile'),
  vs.isValidStrLenWithTrim('body', 'username', 3, 12, 'Please provide valid Username'),
  vs.returnValidations(VALIDATIONS_FOR, 'registerValidations'),
];

const usernameCheck = [vs.isUsername('body', 'username'), vs.returnValidations(VALIDATIONS_FOR, 'usernameCheck')];

const userLoginValidations = [
  vs.isEmailOrMobileOrUsername('body', 'username'),
  vs.isPassword('body', 'password', constant.validatorResponseStrings.LOGIN_PWD_RESPONSE),
  vs.isBoolean('body', 'rememberMe', 'Please check or uncheck remember me.'),
  vs.returnValidations(VALIDATIONS_FOR, 'userLoginValidations'),
];

const passwordValidations = [
  vs.isPassword('body', 'password', constant.validatorResponseStrings.EMPLOYEE_REGISTER_PASSWORD_RESPONSE),
  vs.returnValidations(VALIDATIONS_FOR, 'passwordValidations'),
];

module.exports = {
  registerValidations,
  usernameCheck,
  userLoginValidations,
  passwordValidations,
};
