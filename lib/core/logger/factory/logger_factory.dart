import 'package:upwork_the_unwritten_playbook/core/logger/app_logger.dart';

/// Factory for building different types of loggers.
abstract class LoggerFactory {
  /// Builds logger for common purposes.
  AppLogger get();
}
