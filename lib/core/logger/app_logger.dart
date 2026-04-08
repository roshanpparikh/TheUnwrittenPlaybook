import 'package:stack_trace/stack_trace.dart';

import 'model/logging_level.dart';

abstract class AppLogger {
  const AppLogger();

  /// Logging [message] with specified [level]
  ///
  /// Additionally, accepts [error] and [stackTrace] for the detailed
  /// information
  void log(
    LoggingLevel level,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  });

  /// Logs a the [message] to the device's console if the device is compiled in
  /// debug mode.
  ///
  /// The primary level of logging. Most logging statements should be
  /// debug messages to trace the flow of the program in debug mode but also
  /// to prevent anyone who has a release build of the application from learning
  /// too much about the flow and logic of the application.
  void logDebug(String message, {Object? error, StackTrace? stackTrace}) {
    log(
      LoggingLevel.debug,
      message,
      error: error,
      stackTrace: _parseStackTrace(stackTrace),
    );
  }

  /// Logs the [message] to the device's console.
  ///
  /// The informative logging method should be used sparingly for major changes
  /// in the flow of the program to provide some context on how
  /// the user is using the application
  void i(String message, {Object? error, StackTrace? stackTrace}) {
    log(
      LoggingLevel.info,
      message,
      error: error,
      stackTrace: _parseStackTrace(stackTrace),
    );
  }

  /// Logs the [message] to the device's console.
  ///
  /// The warning logging method should be used only when the developer wants
  /// to log a warning to the console.
  void logWarning(String message, {Object? error, StackTrace? stackTrace}) {
    log(
      LoggingLevel.warning,
      message,
      error: error,
      stackTrace: _parseStackTrace(stackTrace),
    );
  }

  /// Logs the [message] to the device's console.
  ///
  /// The error logging method should be used only when the developer wants
  /// to log an error to the console.
  void e(String message, {Object? error, StackTrace? stackTrace}) {
    log(
      LoggingLevel.error,
      message,
      error: error,
      stackTrace: _parseStackTrace(stackTrace),
    );
  }

  Trace _parseStackTrace(StackTrace? stackTrace) {
    return stackTrace != null ? Trace.from(stackTrace) : Trace.current(1);
  }
}
