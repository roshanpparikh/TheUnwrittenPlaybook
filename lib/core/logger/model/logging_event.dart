import 'package:stack_trace/stack_trace.dart';

import 'logging_level.dart';

/// Contains all required information for logging.
class LoggingEvent {
  final String message;
  final LoggingLevel level;
  final Object? error;
  final StackTrace stackTrace;

  LoggingEvent({
    required this.message,
    required this.level,
    required this.stackTrace,
    this.error,
  });

  String get lastCall {
    final trace = Trace.from(stackTrace);
    if (trace.frames.isEmpty) {
      return '<empty>';
    }
    final frame = trace.frames.first;
    if (frame.member == null || frame.line == null) {
      return frame.toString();
    }
    return '${frame.member}:${frame.line}';
  }

  @override
  String toString() {
    return 'LoggingEvent{'
        'message: $message, '
        'level: $level, '
        'error: $error, '
        'stackTrace: $stackTrace}';
  }
}
