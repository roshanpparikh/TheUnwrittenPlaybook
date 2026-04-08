import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/feedback_service.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/app_navigator.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/transitions/no_transition_animation_material_page.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/base_page_widget.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/repository/tips_repository.dart';
import 'package:upwork_the_unwritten_playbook/di/dependency_provider.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/book_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/chat/chat_page.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/domain/daily_fact_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/domain/notification_settings_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification_service.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification_tap_dispatcher.dart';

import '../../../core/theme/colors.dart';
import '../../playbook/playbook_cubit.dart';
import '../../playbook/playbook_screen.dart';
import '../../tips/screens/tips_screen.dart';
import '../../glossary/screens/glossary_screen.dart';


class ScreensHostWidget extends StatefulBasePageWidget<HostScreenConfiguration> {
  ScreensHostWidget._(super.pageConfiguration);

  @override
  State<ScreensHostWidget> createState() => _HostScreenWidgetState();

  static Page<dynamic> getPage(HostScreenConfiguration configuration) {
    final child = ScreensHostWidget._(configuration);

    return NoTransitionAnimationMaterialPage(
      key: ValueKey(child.pageConfiguration.key),
      child: child,
      name: child.pageConfiguration.path,
      arguments: child.pageConfiguration,

    );
  }
}

class _HostScreenWidgetState extends State<ScreensHostWidget> {
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowDailyFactDialog());
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowNotificationPermissionDialog());
  }

  Future<void> _maybeShowDailyFactDialog() async {
    final pendingPayload = NotificationTapDispatcher.instance.pendingPayload;
    if(pendingPayload == null) return;
    NotificationTapDispatcher.instance.handle(pendingPayload);
  }

  Future<void> _maybeShowNotificationPermissionDialog() async {
    final settingsRepo = DependencyProvider.get<NotificationSettingsRepository>();
    final alreadyShown = await settingsRepo.getPermissionDialogShown();
    if (alreadyShown || !mounted) return;

    final notificationService = DependencyProvider.get<NotificationService>();
    await notificationService.initialize();
    final alreadyGranted = await notificationService.arePermissionsGranted();
    if (alreadyGranted || !mounted) return;

  
    if (!mounted) return;

    final allowed = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (ctx) => _NotificationPermissionDialog(
        onAllow: () => Navigator.of(ctx).pop(true),
        onDismiss: () => Navigator.of(ctx).pop(false),
      ),
    );
    await settingsRepo.setPermissionDialogShown();
    if(allowed ?? false) {
      final granted = await notificationService.requestPermissions();
      if (!granted || !mounted) return;

      await settingsRepo.setEnabled(true);

      final userRepo = DependencyProvider.get<UserRepository>();
      final factRepo = DependencyProvider.get<DailyFactRepository>();
      final interests = userRepo.currentUser.value.personalInfo.interests;
      final notif = await factRepo.factForToday(interests);
      if (notif != null) {
        await notificationService.scheduleDaily(notif);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final colorScheme = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (ctx) => PlaybookCubit(
        DependencyProvider.get<BookRepository>(),
        DependencyProvider.get<UserRepository>(),
        DependencyProvider.get<TipsRepository>(),
        DependencyProvider.get<UserRepository>(),
      )..load(context.read<AppBloc>().state.userState),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'THE UNWRITTEN PLAYBOOK',
            style: TextStyle(
              color: onSurface.withValues(alpha: 0.5),
              fontSize: 14,
              letterSpacing: 3,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: FeedbackButton(
            // onTap: () => InAppConsole.instance.openConsole(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.person_circle, size: 44),
              onPressed: () => context.navigator.addPage(PageConfiguration.profile),
            ),
          ],
        ),
        body: LazyLoadIndexedStack(
          index: _selectedTab,
          preloadIndexes: [0, 1, 2, 3],
          children: [
            PlaybookScreen(),
            TipsScreen(),
            GlossaryScreen(),
            ChatPage(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: onSurface.withValues(alpha: 0.1))),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: (i) => setState(() => _selectedTab = i),
            backgroundColor: colorScheme.surface,
            selectedItemColor: blue,
            unselectedItemColor: onSurface.withValues(alpha: 0.4),
            selectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Text('📖', style: TextStyle(fontSize: 20)),
                label: 'Playbook',
              ),
              BottomNavigationBarItem(
                icon: Text('💡', style: TextStyle(fontSize: 20)),
                label: 'Tips',
              ),
              BottomNavigationBarItem(
                icon: Text('📚', style: TextStyle(fontSize: 20)),
                label: 'Glossary',
              ),
              BottomNavigationBarItem(
                icon: Text('💬', style: TextStyle(fontSize: 20)),
                label: 'Chat',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationPermissionDialog extends StatelessWidget {
  final VoidCallback onAllow;
  final VoidCallback onDismiss;

  const _NotificationPermissionDialog({
    required this.onAllow,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
        decoration: BoxDecoration(
          color: slate,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 40,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [ember, deepEmber],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: ember.withValues(alpha: 0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                CupertinoIcons.bell_fill,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Stay in the game',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Get a daily fact tailored to your interests — straight to your notifications.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [ember, deepEmber],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: ember.withValues(alpha: 0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: onAllow,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Allow notifications',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onDismiss,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white.withValues(alpha: 0.4),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              child: const Text(
                'Not now',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
