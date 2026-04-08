import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/back_dispatcher.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/route_information_parser.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/router_delegate.dart';
import 'package:upwork_the_unwritten_playbook/di/dependency_provider.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/chapter_quiz_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/theme/dark_theme.dart';
import 'package:upwork_the_unwritten_playbook/theme/light_theme.dart';

class TheUnwrittenPlaybookApp extends StatefulWidget {
  final AppRouterDelegate routerDelegate;
  final AppRouteInformationParser routeInformationParser;
  final AppBackButtonDispatcher backButtonDispatcher;

  const TheUnwrittenPlaybookApp({
    super.key,
    required this.routerDelegate,
    required this.routeInformationParser,
    required this.backButtonDispatcher,
  });

  @override
  State<TheUnwrittenPlaybookApp> createState() =>
      _TheUnwrittenPlaybookAppState();
}

class _TheUnwrittenPlaybookAppState extends State<TheUnwrittenPlaybookApp> {
  late final AppBloc appBloc;

  ThemeData? _lightTheme;
  ThemeData? _darkTheme;

  @override
  void initState() {
    super.initState();

    appBloc = AppBloc(
      userRepo: DependencyProvider.get<UserRepository>(),
      quizRepo: DependencyProvider.get<QuizRepository>(),
    );
    appBloc.getCurrentPageConfiguration = () {
      return widget.routerDelegate.currentConfiguration;
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _lightTheme = createLightTheme(context);
    _darkTheme = createDarkTheme(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AppBloc>(create: (_) => appBloc)],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'The Unwritten Playbook',
        theme: _lightTheme,
        darkTheme: _darkTheme,
        themeMode: ThemeMode.system,
        backButtonDispatcher: widget.backButtonDispatcher,
        routerDelegate: widget.routerDelegate,
        routeInformationParser: widget.routeInformationParser,
        builder: (context, child) {
          final mediaQuery = MediaQuery.of(context);

          return MediaQuery(
            data: mediaQuery.copyWith(
              textScaler: mediaQuery.textScaler.clamp(maxScaleFactor: 1.2),
            ),
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
