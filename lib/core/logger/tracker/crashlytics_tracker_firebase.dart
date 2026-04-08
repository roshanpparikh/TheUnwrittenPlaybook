// import 'dart:async';
//
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
//
// import '../model/logging_event.dart';
// import '../model/logging_level.dart';
// import 'logging_tracker.dart';
//
// /// [LoggingTracker] that reports to the Firebase Crashlytics
// class CrashlyticsFirebaseTracker extends LoggingTracker {
//   FirebaseCrashlytics get _crashlytics => FirebaseCrashlytics.instance;
//
//   @override
//   final loggingLevel = LoggingLevel.error;
//
//   @override
//   void log(LoggingEvent event) {
//     final message = '[${event.lastCall}] ${event.message}';
//
//     final recordFuture = _crashlytics.recordError(
//       message,
//       event.stackTrace,
//       reason: event.error,
//     );
//     unawaited(recordFuture);
//   }
// }
