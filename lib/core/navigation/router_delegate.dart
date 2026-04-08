import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_event.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_state.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/navigation_action.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/core/utils.dart';
import 'package:upwork_the_unwritten_playbook/presentation/home/screens/screens_host_widget.dart';
import 'package:upwork_the_unwritten_playbook/presentation/notifications/daily_fact_dialog.dart' show DailyFactDialog;
import 'package:upwork_the_unwritten_playbook/presentation/onboarding/screens/onboarding_video_screen.dart';
import 'package:upwork_the_unwritten_playbook/presentation/onboarding/screens/welcome_screen.dart';
import 'package:upwork_the_unwritten_playbook/presentation/onboarding/widgets/personalization_quiz.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/screens/chapter_detail/chapter_reader_screen.dart';
import 'package:upwork_the_unwritten_playbook/presentation/quiz/screens/quiz_screen.dart';
import 'package:upwork_the_unwritten_playbook/presentation/profile/profile_screen.dart';
import 'package:upwork_the_unwritten_playbook/presentation/splash/splash_page_widget.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/presentation/voice_selector/voice_selection_screen.dart';
import 'back_dispatcher.dart';

class AppRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  late final List<Page> _pages;
  late final AppBackButtonDispatcher backButtonDispatcher;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    _pages = [SplashPageWidget.getPage()];
  }

  Future<T?> showAppDialog<T>(Widget dialog) {
    final context = navigatorKey.currentContext;
    if (context == null) return Future.value(null);

    return showDialog<T>(
      context: context,
      builder: (_) => dialog,
    );
  }

  /// Getter for a list that cannot be changed
  List<Page> get pages => List.unmodifiable(_pages);

  /// Number of pages function
  int numPages() => _pages.length;

  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        ///navigation listener
        BlocListener<AppBloc, AppState>(
          listenWhen: (oldState, newState) {
            final listen =
                oldState.navigationAction != newState.navigationAction &&
                newState.navigationAction is! NavigationActionNone;
            return listen;
          },
          listener: (context, state) {
            switch (state.navigationAction) {
              case NavigationActionAdd add:
                addPage(add.configuration);
              case NavigationActionAddAll addAll:
                for (PageConfiguration configuration in addAll.configurations) {
                  addPage(configuration);
                }
              case NavigationActionAddWidget addWidget:
                return;
              case NavigationActionPop pop:
                pop.key == null ? popRoute() : popTo(pop.key!);
              case NavigationActionNone none:
                return;
              case NavigationActionReplace replaceAction:
                replace(replaceAction.configuration);
              case NavigationActionReplaceAll replaceAllAction:
                replaceAll(replaceAllAction.configurations);
            }

            notifyListeners();

            context.read<AppBloc>().add(AppEvent.setNavigationAction(.none()));
          },
        ),
        ],
      child: Listener(
        // behavior: HitTestBehavior.translucent,
        // onPointerDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        child: Navigator(
          key: navigatorKey,
          onPopPage: _onPopPage,
          // onDidRemovePage: (page) {
          //   print("onDidRemovePage");
          // },
          pages: List.of(_pages),
          observers: [CustomNavigatorObserver()],
        ),
      ),
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void _removePage(Page page) {
    _pages.remove(page);
    notifyListeners();
  }

  void pop() {
    if (canPop()) {
      _removePage(_pages.last);
    }
  }

  void popTo(String key) {
    if (_pages.any((page) => page.name == key)) {
      while (true) {
        final lastPage = _pages.last;
        if (lastPage.name == key) return;
        _pages.removeLast();
      }
    }
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() async {
    print('popRoute: ${canPop()}');
    if (canPop()) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(true);
  }

  void addPage(PageConfiguration pageConfig) {
    final shouldAddPage =
        _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).runtimeType !=
            pageConfig.runtimeType;
    if (shouldAddPage) {
      switch (pageConfig) {
        case SplashPageConfiguration splash:
          _pages.add(SplashPageWidget.getPage(splash));
          break;
        // case SettingsPageConfiguration settings:
        //   _pages.add(SettingsPageWidget.getPage(settings));
        //   break;

        case HostScreenConfiguration host:
          _pages.add(ScreensHostWidget.getPage(host));
          break;
        case OnboardingPageConfiguration onboarding:
          _pages.add(OnboardingVideoScreen.getPage(onboarding));
          break;
        case WelcomePageConfiguration onboarding:
          _pages.add(WelcomeScreen.getPage(onboarding));
          break;

        case AppHasNewVersionPageConfiguration configuration:
          throw UnimplementedError();
        // _pages.add(AppHasNewVersionScreen.getPage(configuration));
        case CredentialsPageConfiguration configuration:
          throw UnimplementedError();
        // _pages.add(CredentialsPageWidget.getPage(configuration));
        case SettingsPageConfiguration():
          // TODO: Handle this case.
          throw UnimplementedError();
        case PersonalizationQuizPageConfiguration personalizationQuiz:
          _pages.add(PersonalizationQuiz.getPage(personalizationQuiz));
        case ChapterPageConfiguration chapterPageConfiguration:
          _pages.add(ChapterReaderScreen.getPage(chapterPageConfiguration));
        case ChapterQuizPageConfiguration quizPageConfiguration:
          _pages.add(QuizScreen.getPage(quizPageConfiguration));
        case ProfilePageConfiguration profile:
          _pages.add(ProfileScreen.getPage(profile));
        case VoiceSelectionPageConfiguration voiceSelectionPageConfiguration:
          _pages.add(VoiceSelectionScreen.getPage(voiceSelectionPageConfiguration));
      }
    }
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
  }

  void replaceAll(List<PageConfiguration> newRoutes) {
    setNewRoutePath(newRoutes.last);
  }

  void push(PageConfiguration newRoute) {
    addPage(newRoute);
  }

  void addAll(List<PageConfiguration> routes) {
    _pages.clear();

    for (var route in routes) {
      addPage(route);
    }
  }

  void replaceStack(List<PageConfiguration> routes) {
    addAll(routes);
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage =
        _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).runtimeType !=
            configuration.runtimeType;
    if (shouldAddPage) {
      _pages.clear();
      addPage(configuration);
    }
    return SynchronousFuture(null);
  }

  void parseRoute(Uri uri) {
    if (uri.pathSegments.isEmpty) {
      // setNewRoutePath(SplashPageConfig);
      return;
    }

    // Handle navapp://deeplinks/details/#
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'details') {
        // pushWidget(Details(int.parse(uri.pathSegments[1])), DetailsPageConfig);
      }
    } else if (uri.pathSegments.length == 1) {
      final path = uri.pathSegments[0];
      // switch (path) {
      //
      // }
    }
  }
}

class CustomNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    _printInfo('didPop', newRoute: previousRoute, oldRoute: route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _printInfo('didReplace', newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _printInfo('didPush', newRoute: route, oldRoute: previousRoute);
  }

  void _printInfo(
    String name, {
    required Route? newRoute,
    required Route? oldRoute,
  }) {
    debugPrint('''NAVIGATION_OBSERVER:
  method: $name,
  oldRoute: ${oldRoute?.settings.name},
  newRoute: ${newRoute?.settings.name},
  ${oldRoute?.settings.name?.replaceFirst('/', "")} => ${newRoute?.settings.name?.replaceFirst('/', "")},
  stack: ${navigator?.widget.pages.map((page) => page.name ?? page.key).join('')}
  ''');
  }
}
