path    = require 'path'
winston = require 'winston'
mkdirp  = require 'mkdirp'

LOG_DIR_NAME = 'logs'

mkdirp.sync LOG_DIR_NAME, (err) ->
  if err then console.log err
  else console.log 'ok'

logDir = path.resolve LOG_DIR_NAME
logger = new(winston.Logger)(
  transports: [
    new (winston.transports.Console)()
    new (winston.transports.File)(filename: "#{logDir}/test.log")
  ]
)

logger.log 'info', 'Hello distributed log files!'
logger.info 'Hello distributed logs!'
logger.error {name: 'syaro', age: 15}
logger.error [{name: 'rize', age: 16}, {name: 'cocoa', age: 15}]
