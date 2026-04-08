import 'package:logger/logger.dart' as lib;
import 'package:upwork_the_unwritten_playbook/core/logger/model/logging_level.dart';

class LogHelpers {
  const LogHelpers._();

  static lib.Level mapLoggingLevel(LoggingLevel level) {
    switch (level) {
      case LoggingLevel.debug:
        return lib.Level.debug;
      case LoggingLevel.info:
        return lib.Level.info;
      case LoggingLevel.warning:
        return lib.Level.warning;
      case LoggingLevel.error:
        return lib.Level.error;
      default:
        throw Exception('Not possible to map level $level');
    }
  }
}
