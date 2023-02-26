const vs = require('../../model/validator-sanitizer');
const constant = require('../../model/constant');
const VALIDATIONS_FOR = 'Lending Validations';

module.exports = {
  addPM: [
    vs.isValidStrLenWithTrim('body', 'name', 3, 100, 'Please provide valid lending purpose'),
    vs.isValidStrLenWithTrim('body', 'last4Digits', 4, 4, 'Please provide valid 4 digits.'),
    vs.isIn('body', 'type', ['CREDIT CARD', 'DEBIT CARD', 'BANK ACCOUNT', 'WALLET', 'GROCERY CARD', 'FOOD CARD'], 'Add a valid payment method types'),
    vs.returnValidations(VALIDATIONS_FOR, 'Add lending'),
  ],

  paramPMIdValidation: [
    vs.isNumeric('params', 'id', 'Please choose a valid lending to proceed.!'),
    vs.returnValidations(VALIDATIONS_FOR, 'Ledger ID Parameter '),
  ],
};
