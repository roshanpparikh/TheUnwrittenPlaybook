import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/theme/colors.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/context_utils.dart';

import 'voice_preview_item.dart';

class VoiceTile extends StatelessWidget {
  final VoicePreviewItem item;
  final bool isSelected;
  final VoidCallback? onTap;
  final VoidCallback? onStop;
  /// Override the trailing icon. If null, the default status icon is shown.
  final Widget? trailing;

  const VoiceTile({
    super.key,
    required this.item,
    this.isSelected = false,
    this.onTap,
    this.onStop,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final primary = Theme.of(context).colorScheme.primary;
    final surface = Theme.of(context).colorScheme.surface;
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: isSelected
            ? primary.withValues(alpha: isDark ? 0.15 : 0.07)
            : surface,
        border: Border.all(
          color: isSelected
              ? primary.withValues(alpha: 0.7)
              : onSurface.withValues(alpha: 0.1),
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              VoiceAvatar(voice: item.voice.title, isSelected: isSelected),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.voice.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected ? primary : onSurface,
                      ),
                    ),
                    if (item.isLoaded)
                      Text(
                        'Preview ready',
                        style: const TextStyle(fontSize: 12, color: sage),
                      )
                    else if (item.error != null)
                      Text(
                        'Preview failed',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              trailing ??
                  VoiceTrailingIcon(item: item, onStop: onStop ?? () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class VoiceAvatar extends StatelessWidget {
  final String voice;
  final bool isSelected;

  const VoiceAvatar({super.key, required this.voice, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? primary.withValues(alpha: 0.15)
            : Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.06),
      ),
      child: Center(
        child: Text(
          voice[0].toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: isSelected
                ? primary
                : Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.45),
          ),
        ),
      ),
    );
  }
}

class VoiceTrailingIcon extends StatelessWidget {
  final VoicePreviewItem item;
  final VoidCallback onStop;

  const VoiceTrailingIcon(
      {super.key, required this.item, required this.onStop});

  @override
  Widget build(BuildContext context) {
    if (item.loading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    if (item.error != null) {
      return Icon(
        Icons.error_outline_rounded,
        size: 22,
        color: Theme.of(context).colorScheme.error.withValues(alpha: 0.7),
      );
    }
    if (item.isLoaded) {
      return const Icon(Icons.play_circle_fill_rounded, size: 26, color: sage);
    }
    return Icon(
      Icons.graphic_eq_rounded,
      size: 22,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
    );
  }
}
