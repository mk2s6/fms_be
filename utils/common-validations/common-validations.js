const { isNumeric, returnValidations } = require('../../model/validator-sanitizer');

const paginationValidation = [
  isNumeric('query', 'limit', 'Please provide number of rows per page'),
  isNumeric('query', 'page_no', 'Please provide page number'),
  returnValidations('Pagination Validations', 'Pagination Variables'),
];

const paramsIdValidation = [
  isNumeric('params', 'id', 'Please please choose a valid item to proceed.!'),
  returnValidations('Params ID Validation', 'ID variable'),
];

module.exports = { paginationValidation, paramsIdValidation };
