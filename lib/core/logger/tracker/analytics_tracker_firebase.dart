// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:fit_progress/core/logger/model/logging_event.dart';
//
// import '../model/logging_level.dart';
// import 'logging_tracker.dart';
//
// class AnalyticsTrackerFirebase implements LoggingTracker {
//   FirebaseAnalytics get _analytics => FirebaseAnalytics.instance;
//
//   @override
//   final loggingLevel = LoggingLevel.info;
//
//   @override
//   void log(LoggingEvent event) {
//     final properties = {
//       'message': event.message,
//       'trace': event.stackTrace.toString(),
//       'event_type': 'system',
//     };
//
//     switch (event.level) {
//       case LoggingLevel.warning:
//         _analytics.logEvent(name: 'app_warning', parameters: properties);
//         break;
//       case LoggingLevel.error:
//         if (event.error != null) {
//           properties.putIfAbsent('error', () => event.error.toString());
//         }
//         _analytics.logEvent(name: 'app_error', parameters: properties);
//         break;
//       default:
//         _analytics.logEvent(name: 'app_info', parameters: properties);
//     }
//   }
//
//   @override
//   void handleEvent(LoggingEvent event) {
//     // TODO: implement handleEvent
//   }
// }
