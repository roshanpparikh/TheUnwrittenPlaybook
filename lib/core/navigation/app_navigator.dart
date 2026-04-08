import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_event.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/navigation_action.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';

class AppNavigator {
  AppNavigator(this.context);

  final BuildContext context;

  void addPage(PageConfiguration configuration) {
    context.read<AppBloc>().add(AppEvent.setNavigationAction(NavigationAction.add(configuration),),);
  }

  void replacePage(PageConfiguration configuration) {
    context.read<AppBloc>().add(AppEvent.setNavigationAction(NavigationAction.replace(configuration),),);
  }

  void pop([String? key]) {
    context.read<AppBloc>().add(AppEvent.setNavigationAction(NavigationAction.pop(key),),);
  }
}

extension NavigationHelpersExt on BuildContext {
  AppNavigator get navigator => AppNavigator(this);
}
