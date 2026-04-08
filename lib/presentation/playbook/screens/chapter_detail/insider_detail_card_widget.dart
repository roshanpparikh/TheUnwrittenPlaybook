import 'package:flutter/material.dart';

class InsiderDetailCardWidget extends StatelessWidget {
  final String insiderDetail;
  const InsiderDetailCardWidget({required this.insiderDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0x20F59E0B), Color(0x08F59E0B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: const Border(
          left: BorderSide(color: Color(0xFFF59E0B), width: 3),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'THE INSIDER DETAIL',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2,
              color: Color(0xFFF59E0B),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            insiderDetail,
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

