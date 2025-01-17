const vs = require('../../model/validator-sanitizer');
const constant = require('../../model/constant');
const VALIDATIONS_FOR = 'Ledger Validations';

module.exports = {
  addLedger: [
    vs.isValidStrLenWithTrim('body', 'name', 3, 100, 'Please provide valid ledger name'),
    vs.isValidStrLenWithTrim('body', 'description', 3, 250, 'Please provide valid User name'),
    vs.isValidStrLenWithTrim('body', 'purpose', 3, 500, 'Please provide valid User name'),
    vs.isArray('body', 'category'),
    vs.isValidTransactionCategory('body', 'category.*'),
    vs.returnValidations(VALIDATIONS_FOR, 'Add Ledger'),
  ],

  paramLedgerIdValidation: [
    vs.isNumeric('params', 'id', 'Please choose a valid ledger to proceed.!'),
    vs.returnValidations(VALIDATIONS_FOR, 'Ledger ID Parameter '),
  ],
};
