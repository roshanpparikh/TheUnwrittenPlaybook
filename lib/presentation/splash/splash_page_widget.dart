import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_event.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bottom_navigation_pages.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_state.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/navigation_action.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/base_page_widget.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/context_utils.dart';
import 'package:upwork_the_unwritten_playbook/presentation/splash/splash_image_widget.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/app_scaffold.dart';

class SplashPageWidget extends StatefulBasePageWidget<SplashPageConfiguration> {
  SplashPageWidget._(SplashPageConfiguration? configuration)
    : super(configuration ?? PageConfiguration.splash());

  static Page<dynamic> getPage([SplashPageConfiguration? configuration]) {
    final child = SplashPageWidget._(configuration);
    return MaterialPage<SplashPageConfiguration>(
      key: ValueKey(child.pageConfiguration.key),
      child: child,
      name: child.pageConfiguration.path,
      arguments: child.pageConfiguration,
    );
  }

  @override
  State<SplashPageWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashPageWidget>
    with TickerProviderStateMixin {
  double buttonsBottomPosition = -200;

  late AnimationController _opacityController;
  late Animation<double> _opacityAnimation;
  bool _animationComplete = false;
  bool _dataLoaded = false;
  NavigationAction? _pendingNav;

  @override
  void initState() {
    super.initState();

    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _opacityController, curve: Curves.easeOut),
    );
    _opacityController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        _animationComplete = true;
        if (_dataLoaded) _navigate();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _opacityController.forward();
    });
  }

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }


  void _navigate() {
    if (!mounted || _pendingNav == null) return;
    context.read<AppBloc>().add(AppEvent.setNavigationAction(_pendingNav!));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return BlocListener<AppBloc, AppState>(
      listenWhen: (prev, next) => !prev.initialized && next.initialized,
      listener: (context, state) {
        _pendingNav = NavigationAction.replaceAll([
          PageConfiguration.onboarding,
        ]);
        if (!state.userState.isStub && state.onboardingVideoViewed) {
          _pendingNav = NavigationAction.replaceAll([
            PageConfiguration.host(selectedPage: AppBottomNavigationPage.playbook),
          ]);
        }

        _dataLoaded = true;
        if (_animationComplete) _navigate();
      },
      child: AppScaffold(
        lightBg: Colors.white,
        showGradientBackground: false,
        body: FadeTransition(
          opacity: _opacityAnimation,
          child: SplashImage(
            imagePath: isDark
                ? "assets/image/splash_image_dark.png"
                : "assets/image/splash_image.png",
          ),
        ),
      ),
    );
  }
}
