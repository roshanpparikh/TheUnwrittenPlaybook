import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';

/// A single-select option row — same visual style as the onboarding quiz.
class QuizSingleOptionTile extends StatelessWidget {
  final Map<String, dynamic> option;
  final bool isSelected;
  final VoidCallback onTap;
  final Color onSurface;

  const QuizSingleOptionTile({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
    required this.onSurface,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0x332D5BFF), Color(0x1A4F46E5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : onSurface.withValues(alpha: 0.04),
          border: Border.all(
            color: isSelected ? blue : onSurface.withValues(alpha: 0.08),
            width: isSelected ? 1.5 : 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 36,
              child: Text(
                option['icon'] as String,
                style: const TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                option['label'] as String,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: onSurface),
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle_rounded, size: 18, color: blue.withValues(alpha: 0.8)),
          ],
        ),
      ),
    );
  }
}

/// A single cell in the multi-select interests grid.
class QuizMultiGridItem extends StatelessWidget {
  final Map<String, dynamic> option;
  final bool isSelected;
  final VoidCallback onTap;
  final Color onSurface;

  const QuizMultiGridItem({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
    required this.onSurface,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0x332D5BFF), Color(0x1A4F46E5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : onSurface.withValues(alpha: 0.04),
          border: Border.all(
            color: isSelected ? blue : onSurface.withValues(alpha: 0.08),
            width: isSelected ? 1.5 : 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(option['icon'] as String, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 8),
            Text(
              option['label'] as String,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: onSurface),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// The gradient action button used throughout the quiz.
class QuizGradientButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback? onTap;

  const QuizGradientButton({
    super.key,
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: enabled
            ? const LinearGradient(colors: [blue, deepBlue], begin: Alignment.topLeft, end: Alignment.bottomRight)
            : null,
        color: enabled ? null : Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        boxShadow: enabled
            ? [BoxShadow(color: blue.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 8))]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: white, fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
