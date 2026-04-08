import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';

class FadeTransitionPage<C extends PageConfiguration> extends Page<C> {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const FadeTransitionPage({
    required this.child,
    required C super.arguments,
    super.key,
    super.name,
    this.duration = const Duration(milliseconds: 350),
    this.curve = Curves.easeOut,
  });

  @override
  Route<C> createRoute(BuildContext context) {
    return PageRouteBuilder<C>(
      settings: this,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final fade = CurvedAnimation(parent: animation, curve: curve);
        return FadeTransition(opacity: fade, child: child);
      },
    );
  }
}