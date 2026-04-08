import 'package:in_app_console/in_app_console.dart' as iac;

import '../model/logging_event.dart';
import '../model/logging_level.dart';
import 'logging_tracker.dart';

/// Destination where logs go to the in-app console
class InAppLoggingTracker extends LoggingTracker {
  final iac.InAppLogger _logger;

  @override
  List<LoggingLevel> loggingLevels = [LoggingLevel.info];

  InAppLoggingTracker({String? label})
      : _logger = iac.InAppLogger() {
    if (label != null && label.isNotEmpty) {
      _logger.setLabel(label);
    }

    iac.InAppConsole.instance.addLogger(_logger);
  }

  @override
  void log(LoggingEvent event) {

    switch (event.level) {
      case LoggingLevel.debug:
      case LoggingLevel.info:
        _logger.logInfo(event.message);
        break;

      case LoggingLevel.warning:
        _logger.logWarning(message: event.message);
        break;

      case LoggingLevel.error:
        _logger.logError(
          message: event.message,
          error: event.error,
          stackTrace: event.stackTrace,
        );
        break;
      case _:
       break;  
    }
  }
}