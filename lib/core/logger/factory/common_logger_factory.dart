import 'package:upwork_the_unwritten_playbook/core/logger/app_logger.dart';

import '../composite_logger.dart';
import '../tracker/console_tracker.dart';
import '../tracker/logging_tracker.dart';
import 'logger_factory.dart';

/// Common factory for building loggers.
class CommonLoggerFactory implements LoggerFactory {
  final bool _logToConsole;
  final List<LoggingTracker> _additionalTrackers;

  AppLogger? _commonLogger;

  CommonLoggerFactory({
    bool logToConsole = true,
    List<LoggingTracker> additionalTrackers = const [],
  })  : _logToConsole = logToConsole,
        _additionalTrackers = additionalTrackers;

  @override
  AppLogger get() {
    _commonLogger ??= _buildLogger();
    return _commonLogger!;
  }

  AppLogger _buildLogger() {
    return CompositeLogger(trackers: [
      if (_logToConsole) ConsoleTracker(),
      ..._additionalTrackers,
    ]);
  }
}
