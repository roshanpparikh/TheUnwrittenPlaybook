import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/theme/colors.dart';

class TheMoveCardWidget extends StatelessWidget {
  final String theMove;
  const TheMoveCardWidget({super.key, required this.theMove});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0x20FF6B35), Color(0x08FF6B35)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: const Border(left: BorderSide(color: ember, width: 3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'THE MOVE',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2,
              color: ember,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            theMove,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.85),
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

