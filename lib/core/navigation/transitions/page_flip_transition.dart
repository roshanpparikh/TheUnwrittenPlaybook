import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';

class PageFlipTransitionPage<C extends PageConfiguration> extends Page<C> {
  final Widget child;
  final bool fromRight;

  const PageFlipTransitionPage({
    required this.child,
    required C super.arguments,
    super.key,
    super.name,
    this.fromRight = true,
  });

  @override
  Route<C> createRoute(BuildContext context) {
    return PageRouteBuilder<C>(
      settings: this,
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: Duration.zero, // ✅ no pop animation
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = fromRight ? -1.5 : 1.5; // ~90deg
        final flipIn = Tween<double>(begin: begin, end: 0.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        );

        return AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (context, child) {
            final matrix = Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(flipIn.value);

            return Transform(
              alignment: fromRight ? Alignment.centerRight : Alignment.centerLeft,
              transform: matrix,
              child: child,
            );
          },
        );
      },
    );
  }
}