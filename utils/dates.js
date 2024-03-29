const moment = require('moment');

const addNDaysToToday = (N) => moment(new Date()).add(N, 'days').utc().format();

const currentDate = () => moment().format('YYYY-MM-DD');

const currentFNSDate = () => moment().format('YYYYMMDD');

const getCurrentDateTime = () => moment().utc().format();

module.exports = { addNDaysToToday, currentDate, currentFNSDate, getCurrentDateTime };
