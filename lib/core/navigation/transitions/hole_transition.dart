import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';

class HoleTransitionPage<C extends PageConfiguration> extends Page<C> {
  final Widget child;

  const HoleTransitionPage({
    required this.child,
    super.key,
    super.name,
    required C super.arguments,
  });

  @override
  Route<C> createRoute(BuildContext context) {
    return PageRouteBuilder<C>(

        settings: this,
        transitionDuration: const Duration(seconds: 3),
        transitionsBuilder: (context, animation, animation2, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;


          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          animation.drive(tween);

          return AnimatedBuilder(
              animation: animation.drive(tween),
              child: child,
              builder: (context, child) {
                return ClipPath(
                  clipper: _HoleClipper(animation.value),
                  child: child,
                );
              }
              );
        } ,
        pageBuilder: (context, animation, secondaryAnimation) {
          return child;
        });
  }
}

class CustomTransitionBuilder extends PageTransitionsBuilder {
  const CustomTransitionBuilder();
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease));
    return ScaleTransition(
        scale: animation.drive(tween),
        child: FadeTransition(opacity: animation, child: child));
  }
}

class _HoleClipper extends CustomClipper<Path> {
  final double progress;
  _HoleClipper(this.progress);

  @override
  Path getClip(Size size) {
    final center = size.center(Offset.zero);
    final radius = lerpDouble(0, center.distance, Curves.easeOut.transform(progress))!;
    print("center: $center, radius: $radius");
    final oval = Rect.fromCircle(center: center, radius: radius);
    return Path()..addOval(oval);
  }

  @override
  bool shouldReclip(covariant _HoleClipper oldClipper) =>
      oldClipper.progress != progress;
}