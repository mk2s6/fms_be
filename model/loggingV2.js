/* eslint-disable object-curly-newline */
/* eslint-disable arrow-parens */
/* eslint-disable implicit-arrow-linebreak */
/**
 * Functions needed for logging the application. We are using winston as our logger library.
 */

const config = require('config');
const constant = require('./constant');
const pino = require('pino');
const pretty = require('pino-pretty');
const { currentFNSDate } = require('../utils/dates');

const loggingLevels = {
  error: 90,
  warn: 80,
  http: 70,
  info: 60,
  verbose: 50,
  debug: 45,
  silly: 0,
};
const customColors = `error:red,warn:yellow,info:blue,http:rainbow,verbose:grey,debug:yellow,silly:white`;

const logger = pino(
  {
    level: config.get('log_level'),
    customLevels: loggingLevels,
    useOnlyCustomLevels: true,
    formatters: {
      level: (label) => {
        return { level: label };
      },
    },
    timestamp: pino.stdTimeFunctions.isoTime,
  },
  pretty({ colorize: true, customColors }),
);

logger.info('Loading Logger Module - PINO..!');

const logFileName = () => `./logs/${currentFNSDate()}.log`;

const loggingStreams = [];

if (config.get('log_to_files') === 'true') {
  loggingStreams.push({
    stream: pino.destination(logFileName()),
  });
}

if (config.get('log_to_console') === 'true') {
  loggingStreams.push({ stream: pretty({ colorize: true, customColors }) });
}

const LoggerWithMeta = (defaultMeta) =>
  pino(
    {
      level: config.get('log_level'),
      customLevels: loggingLevels,
      useOnlyCustomLevels: true,
      timestamp: pino.stdTimeFunctions.isoTime,
      formatters: {
        level: (label) => {
          return { level: label };
        },
      },
      mixin: () => defaultMeta,
    },
    pino.multistream(loggingStreams, { levels: loggingLevels, dedupe: true }),
  );

module.exports.basicLogger = logger;
module.exports.logger = LoggerWithMeta;
