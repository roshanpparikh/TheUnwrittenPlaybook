import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';

class NoTransitionAnimationMaterialPage<C extends PageConfiguration> extends Page<C> {
  final Widget child;

  const NoTransitionAnimationMaterialPage({
    required this.child,
    super.key,
    super.name,
    required C super.arguments,
  });

  @override
  Route<C> createRoute(BuildContext context) {
    return PageRouteBuilder<C>(

        settings: this,
        transitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, animation2, child) {
          return child;
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return child;
        });
  }
}