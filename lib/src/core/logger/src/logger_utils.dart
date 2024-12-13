import 'imp/logger.dart';

final class AppLogger {
  static final _debugLogger = DebugLogger();
  static final _errorLogger = ErrorLogger();
  static final _wtfLogger = WtfLogger();

  /// the default logger if no type is specified.
  void call(String message, {String? name}) {
    _debugLogger.log(message, name: name);
  }

  void d(String message, {String? name}) {
    _debugLogger.log(message, name: name);
  }

  void error(String message, {String? name}) {
    _errorLogger.log(message, name: name);
  }

  void wtf(String message, {String? name}) {
    _wtfLogger.log(message, name: name);
  }
}

/// A logger that logs a debug message to the console.

final logger = AppLogger();
