import 'dart:developer' as developer;

import 'package:upwork_the_unwritten_playbook/core/logger/model/logging_event.dart';
import 'package:upwork_the_unwritten_playbook/core/logger/model/logging_level.dart';
import 'package:upwork_the_unwritten_playbook/core/logger/tracker/logging_tracker.dart';

class SimpleLogger extends LoggingTracker {
  @override
  List<LoggingLevel> get loggingLevels => [
        LoggingLevel.debug,
        LoggingLevel.info,
        LoggingLevel.warning,
        LoggingLevel.error,
      ];

  @override
  void log(LoggingEvent event) {
    final emoji = switch (event.level) {
      LoggingLevel.debug => '🐞',
      LoggingLevel.info => 'ℹ️',
      LoggingLevel.warning => '⚠️',
      LoggingLevel.error => '❌',
      _ => '📝',
    };

    developer.log(
      '\n$emoji ${event.message}',
      error: event.error,
      stackTrace: event.stackTrace,
    );
  }
}