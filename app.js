// =============================================
// ENVIRONMENT and CONFIGURATION SETTINGS
// =============================================
const config = require('config');
const { logger, basicLogger } = require('./model/loggingV2');

// Check configuration settings
if (config.get('environment') === 'default') {
  basicLogger.info('Please set the NODE_ENV to a valid values (development/production/testing/staging).');
  process.exit(1);
}

if (config.get('environment') !== 'test') {
  basicLogger.info(`Your Application environment: ${config.get('environment')}`);
  // console.log(`Your Application TimeZone: ${process.env.TZ}`);
}

// =============================================
// Load necessary MODULES for our APP
// =============================================
const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const cors = require('cors');
const moment = require('moment');
const shortid = require('shortid');
const RG = require('./model/response-generator');
const constant = require('./model/constant');

/**
 * Require for Routing
 */
// const indexRouter = require('./routes/index');
const Router = require('./routes/routes');
const { errList } = require('./model/error');
const { validateSession } = require('./model/auth');
const { pinoHttp } = require('pino-http');

const app = express();

app.use(async (req, res, next) => {
  req.utc_start_time = moment.utc();
  const loggerId = await shortid.generate();
  const reqId = await shortid.generate();
  req.logger_id = loggerId;
  res.setHeader('logger_id', loggerId);
  res.setHeader('request_id', reqId);
  req.hostname = req.headers.origin;
  req.logger_meta = { loggerId, url: req.url, method: req.method, requestId: reqId, host: req.hostname, reqIP: req.headers['x-real-ip'] };
  req.logger = logger(req.logger_meta);
  next();
});

const corsOptions = {
  allowedHeaders: [
    'content-type',
    'vary',
    'age',
    'server',
    'keep-alive',
    'etag',
    'date',
    'content-length',
    'content-encoding',
    'connection',
    constant.TOKEN_NAME,
    'code',
  ],
  exposedHeaders: [
    'content-type',
    'vary',
    'age',
    'server',
    'keep-alive',
    'etag',
    'date',
    'content-length',
    'content-encoding',
    'connection',
    constant.TOKEN_NAME,
    'code',
  ],
};

// disable the x-powered-by headers
app.disable('x-powered-by');
app.use(cors(corsOptions));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use((req, res, next) => {
  const log = req.logger;
  log.info('Execution Started');
  process.on('unhandledRejection', function (err) {
    log.warn({ msg: '*** app | unhandledRejection ***', err });
    return res.send(RG.internalError(errList.internalError.ERR_INSERT_USER_INSERT_FAILURE));
  });
  process.on('unhandledException', function (err, req, res) {
    log.warn({ msg: '*** app | unhandledRejection ***', err });
    return res.send(RG.internalError(errList.internalError.ERR_GLOBAL_UNHANDLED_EXCEPTION));
  });
  next();
});

// available in production environment0.0
if (config.get('environment') !== 'production') {
  app.use('/docs', express.static(path.join(__dirname, 'docs')));
}

if (config.get('log_incoming_request') === 'true') {
  app.use((req, res, next) => {
    pinoHttp({ logger: req.logger, useLevel: 'http' })(req, res);
    next();
  });
}

app.use('/img', express.static(path.join(__dirname, 'public/img')));

app.use(validateSession);

// The docs which gives REST API out backend support should not be

/**
 * Session and Authentication
 */
// app.use(passport.initialize());

/**
 *  Routing
 *  Here we have all routes defined in our production application
 */

// app.use('/test', indexRouter);
app.use('/', Router);

/**
 * Routes defined for testing only included in test environment
 */
if (config.get('environment') === 'test') {
  // eslint-disable-next-line global-require
  const testValidatorSanitizerRouter = require('./tests/test_helper/test-validator-sanitizer');
  app.use('/QA/validator_sanitizer', testValidatorSanitizerRouter);
}

// catch 404 and forward to error handler
app.use((req, res, next) => {
  next(createError(404));
});

// error handler
app.use((err, req, res, next) => {
  // console.log(err);
  // set locals, only providing error in development
  res.locals.message = err.message;
  // TODO Add environment setting for development and production and enable this
  //  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.send(RG.errorResponse('Not Found', err.status, 'Resource you are trying to access is not found', '', req.url));
});

module.exports = app;
