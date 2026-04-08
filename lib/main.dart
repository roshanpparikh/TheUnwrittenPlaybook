import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_app_console/in_app_console.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/back_dispatcher.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/route_information_parser.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/router_delegate.dart';
import 'package:upwork_the_unwritten_playbook/di/app_dependency_resolver.dart';
import 'package:upwork_the_unwritten_playbook/di/dependency_provider.dart';
import 'package:upwork_the_unwritten_playbook/isar/app_isar.dart';
import 'package:upwork_the_unwritten_playbook/isar/embedded_seed_chunk_service.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification_service.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification_tap_dispatcher.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  InAppConsole.kEnableConsole = kDebugMode;

  final isar = await AppIsar.instance();

  final routerDelegate = AppRouterDelegate();
  final routeInformationParser = AppRouteInformationParser();
  final backButtonDispatcher = AppBackButtonDispatcher(routerDelegate);

  NotificationTapDispatcher.instance.attachRouter(routerDelegate);
  AppDependencyResolver.register(isar);
  final notificationService = DependencyProvider.get<NotificationService>();
  await notificationService.initialize();
  final appLaunchNotificationResponse = await notificationService
      .getNotificationResponseAppLaunch();
  // inAppLogger.logInfo('appLaunchNotificationResponse is null: ${appLaunchNotificationResponse == null}');

  if (appLaunchNotificationResponse != null) {
    NotificationTapDispatcher.instance.savePendingPayload(
      appLaunchNotificationResponse.payload,
    );
  }

  // final docs = await getApplicationDocumentsDirectory();
  // debugPrint('DOCS = ${docs.path}');

  final seedService = EmbeddedChunkSeedService(isar);
  await seedService.ensureSeeded(
    assetPath: 'assets/json/embedded_chapter_chunks.json',
    version: 'v1',
  );

  runApp(
    BetterFeedback(
      themeMode: ThemeMode.light,
      child: TheUnwrittenPlaybookApp(
        routerDelegate: routerDelegate,
        routeInformationParser: routeInformationParser,
        backButtonDispatcher: backButtonDispatcher,
      ),
    ),
  );
}
