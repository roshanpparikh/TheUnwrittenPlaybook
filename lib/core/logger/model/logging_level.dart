/// Logging level used to distinguish the messages.
///
/// [debug] is custom messages which mustn't be reported anywhere.
/// May contain private information.
///
/// [info] common level for all informational messages.
///
/// [warning] important but not critical messages
///
/// [error] the highest priority messages which must be additionally
/// reported to the error monitoring as Crashlytics
class LoggingLevel {
  static const debug = LoggingLevel._(0);
  static const info = LoggingLevel._(1);
  static const warning = LoggingLevel._(2);
  static const error = LoggingLevel._(3);

  final int index;

  const LoggingLevel._(this.index);
}
