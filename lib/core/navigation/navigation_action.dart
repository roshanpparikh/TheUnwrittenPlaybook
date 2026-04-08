import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';

part 'navigation_action.freezed.dart';

@freezed
sealed class NavigationAction with _$NavigationAction {

  factory NavigationAction.add(PageConfiguration configuration) = NavigationActionAdd;
  factory NavigationAction.addAll(List<PageConfiguration> configurations) = NavigationActionAddAll;
  factory NavigationAction.addWidget(Widget widget) = NavigationActionAddWidget;
  factory NavigationAction.pop([String? key]) = NavigationActionPop;
  factory NavigationAction.none() = NavigationActionNone;
  factory NavigationAction.replace(PageConfiguration configuration) = NavigationActionReplace;
  factory NavigationAction.replaceAll(List<PageConfiguration> configurations) = NavigationActionReplaceAll;
}
