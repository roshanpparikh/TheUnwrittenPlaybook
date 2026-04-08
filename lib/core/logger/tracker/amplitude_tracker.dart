// import 'dart:async';
//
// import 'package:amplitude_flutter/amplitude.dart';
// import 'package:amplitude_flutter/identify.dart';
// import 'package:core/src/logger/model/logging_event.dart';
// import 'package:flutter/foundation.dart';
//
// import '../model/logging_level.dart';
// import 'logging_tracker.dart';
//
// class AmplitudeTracker extends LoggingTracker {
//   AmplitudeTracker._() {
//     _analytics = Amplitude.getInstance(instanceName: "Cofollow");
//   }
//
//   static AmplitudeTracker get instance {
//     return _instance ??= AmplitudeTracker._();
//   }
//
//   late Amplitude _analytics;
//   static AmplitudeTracker? _instance;
//
//   static Future<void> init(String amplitudeProjectApiKey,
//       [String? userId]) async {
//     if (amplitudeProjectApiKey.isEmpty) return;
//     _instance ??= AmplitudeTracker._();
//     await _instance?._analytics.init(amplitudeProjectApiKey);
//     if (kDebugMode) {
//       print("AmplitudeTracker initialized");
//     }
//     await _instance?._analytics.uploadEvents();
//   }
//
//   Future<void> initializeUser(String email, String id) async {
//     if (_instance == null) return;
//     final user = Identify();
//     user.setOnce("email", email);
//     await _analytics.setUserId(id);
//     await _analytics.identify(user);
//   }
//
//   @override
//   final loggingLevel = LoggingLevel.info;
//
//   @override
//   void handleEvent(LoggingEvent event) {
//     unawaited(_analytics.logEvent(event.message));
//   }
// }
