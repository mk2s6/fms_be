const vs = require('../../model/validator-sanitizer');
const constant = require('../../model/constant');
const VALIDATIONS_FOR = 'Transaction Validations';

module.exports = {
  addTransaction: [
    vs.isValidStrLenWithTrim('body', 'purpose', 3, 100, 'Please provide valid User name'),
    vs.isMinLenWithTrim('body', 'description', 3, 'Please provide valid User name'),
    vs.isValidCurrencyCode('body', 'currencyCode'),
    vs.isValidTransactionCategory('body', 'category'),
    vs.isValidTransactionMode('body', 'mode'),
    vs.isValidTransactionType('body', 'type'),
    vs.isNonNegativeNumeric('body', 'amount', 'Please provide a valid amount value.'),
    vs.isValidPastDateTodayAllowed('body', 'date'),
    vs.returnValidations(VALIDATIONS_FOR, 'Add Transaction'),
  ],

  paramTransactionIdValidation: [
    vs.isNumeric('params', 'id', 'Please choose a valid transaction to delete.'),
    vs.returnValidations(VALIDATIONS_FOR, 'Transaction ID Parameter '),
  ],
};
