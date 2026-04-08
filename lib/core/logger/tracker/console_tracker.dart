import 'package:logger/logger.dart' as lib;
import 'package:upwork_the_unwritten_playbook/core/logger/utils/log_helpers.dart';

import '../model/logging_event.dart';
import '../model/logging_level.dart';
import 'logging_tracker.dart';

/// Destination where logs go to the console
class ConsoleTracker extends LoggingTracker {
  final lib.Logger _logger;

  @override
  List<LoggingLevel> loggingLevels = [LoggingLevel.debug];

  ConsoleTracker()
      : _logger = lib.Logger(
          printer: lib.PrefixPrinter(
            lib.PrettyPrinter(
              colors: true,
              lineLength: 120,
              methodCount: 2,
              printTime: true,
              stackTraceBeginIndex: 1,
              errorMethodCount: null,
            ),
          ),
        );
  // _dateFormat = DateFormat('HH:mm:ss.mmm');

  @override
  void log(LoggingEvent event) {
    final level = LogHelpers.mapLoggingLevel(event.level);

    _logger.log(
      level,
      event.message,
      error: event.error,
      stackTrace: event.stackTrace,
    );
  }
}
