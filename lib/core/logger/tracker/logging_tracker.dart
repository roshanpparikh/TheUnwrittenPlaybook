import '../model/logging_event.dart';
import '../model/logging_level.dart';

/// Output destination for logger.
///
/// Responsible for sending messages to the specific destinations:
/// console, file, crashlytics and etc.
abstract class LoggingTracker {
  /// Minimum logging level.
  ///
  /// All messages lower this level will be ignored.
  List<LoggingLevel> get loggingLevels;

  /// Log a message at [LoggingEvent.level].
  void log(LoggingEvent event);

  @override
  String toString() {
    return "$runtimeType";
  }
}
