import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/theme/colors.dart';

class ForYouCardWidget extends StatelessWidget {
  final String genderNote;
  const ForYouCardWidget({super.key, required this.genderNote});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0x2010B981), Color(0x0810B981)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: const Border(left: BorderSide(color: sage, width: 3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'FOR YOU',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2,
              color: sage,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            genderNote,
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
