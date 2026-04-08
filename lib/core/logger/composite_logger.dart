import 'package:stack_trace/stack_trace.dart';
import 'package:upwork_the_unwritten_playbook/core/logger/app_logger.dart';
import 'package:upwork_the_unwritten_playbook/core/logger/tracker/in_app_logging_tracker.dart';
import 'package:upwork_the_unwritten_playbook/core/logger/tracker/simple_logger.dart';

import 'model/logging_event.dart';
import 'model/logging_level.dart';
import 'tracker/logging_tracker.dart';

class CompositeLogger extends AppLogger {
  final List<LoggingTracker> _trackers = [
    SimpleLogger(),
    InAppLoggingTracker(),
  ];

  CompositeLogger({required List<LoggingTracker> trackers}) {
    _trackers.addAll(trackers);
  }

  @override
  void log(
    LoggingLevel level,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    final trace = stackTrace ?? Trace.current(1);
    final event = LoggingEvent(
      message: message,
      level: level,
      error: error,
      stackTrace: trace,
    );
    _logEvent(event);
  }

  void _logEvent(LoggingEvent event) {
    for (final destination in _trackers) {
      if (event.level != destination.loggingLevels) {
        continue;
      }
      destination.log(event);
    }
  }
}
