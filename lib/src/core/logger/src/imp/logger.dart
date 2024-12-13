import 'dart:developer' as developer;

const _numberOfEmoji = 40;
final _headerDivider = '- ' * _numberOfEmoji;
const _footerDivider = '';
final _date = DateTime.now();

sealed class Logger {
  void log(String message, {String? name});
}

/// A logger that logs a debug message to the console.
class DebugLogger extends Logger {
  DebugLogger._();

  factory DebugLogger() => _instance;

  static final DebugLogger _instance = DebugLogger._();

  @override
  void log(String message, {String? name}) {
    developer.log("""
$_headerDivider
        🐛🐛🐛 $message 🐛🐛🐛
        $_footerDivider
      """, name: name ?? 'Log', time: _date);
  }
}

/// A logger that logs an error message to the console. ..
class ErrorLogger extends Logger {
  ErrorLogger._();
  factory ErrorLogger() => _instance;

  static final ErrorLogger _instance = ErrorLogger._();

  @override
  void log(String message, {String? name}) {
    developer.log("""
$_headerDivider
        ❌❌❌ $message ❌❌❌
        $_footerDivider
    """, name: name ?? 'Error', time: _date, error: message);
  }
}

/// A logger that logs a message to the console.
class WtfLogger extends Logger {
  WtfLogger._();

  factory WtfLogger() => _instance;

  static final WtfLogger _instance = WtfLogger._();
  @override
  void log(String message, {String? name}) {
    developer.log("""
$_headerDivider  """,
        // 🤷🤷🤷 $message 🤷🤷🤷
        // $_footerDivider
        name: name ?? 'Wtf',
        time: _date,
        error: message,
        stackTrace: StackTrace.current);
  }
}
