const vs = require('../../model/validator-sanitizer');
const VALIDATIONS_FOR = 'Lending Validations';

module.exports = {
  addLending: [
    vs.isValidStrLenWithTrim('body', 'purpose', 3, 100, 'Please provide valid lending purpose'),
    vs.isValidStrLenWithTrim('body', 'details', 3, 500, 'Please provide valid lending related details'),
    vs.ifExistIsEmail('body', 'toEmail'),
    vs.ifExistIsMobile('body', 'toPhone'),
    vs.isValidTransactionMode('body', 'mode'),
    vs.isValidTransactionCategory('body', 'category'),
    vs.isValidCurrencyCode('body', 'currencyCode'),
    vs.isAmount('body', 'amount', 'Please provide a valid amount.'),
    vs.isValidPastDateTodayAllowed('body', 'onDate'),
    vs.isBoolean('body', 'isBorrowed', 'Please choose whether the transaction is a being Borrowed or Lending.!'),
    vs.ifExistsIsNumeric('body', 'paymentMethod', 'Please choose valid payment method.!'),
    vs.returnValidations(VALIDATIONS_FOR, 'Add lending'),
  ],

  paramLendingIdValidation: [
    vs.isNumeric('params', 'id', 'Please choose a valid lending to proceed.!'),
    vs.returnValidations(VALIDATIONS_FOR, 'lending ID Parameter '),
  ],
};
