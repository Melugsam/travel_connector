// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:logging/logging.dart';

class LoggingService {
  final Logger _logger;

  LoggingService(this._logger);

  get logger => _logger;

  static LoggingService create() {
    final logger = Logger('AppLogger');
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      log('${record.level.name}: ${record.time}: ${record.message}');
      if (record.error != null) {
        log('Error: ${record.error}');
      }
      if (record.stackTrace != null) {
        log('StackTrace: ${record.stackTrace}');
      }
    });
    return LoggingService(logger);
  }

  void logInfo(String message) {
    _logger.info(message);
  }

  void logWarning(String message) {
    _logger.warning(message);
  }

  void logError(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.severe(message, error, stackTrace);
  }
}
