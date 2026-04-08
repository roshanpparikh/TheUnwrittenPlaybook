import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/theme/colors.dart';

import 'chapter_tts_player_controller.dart';
import 'cubit/chapter_tts_state.dart';

class ChapterTtsPlayerWidget extends StatelessWidget {
  final ChapterTtsPlayerController controller;

  const ChapterTtsPlayerWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChapterTtsState>(
      stream: controller.stream,
      initialData: controller.state,
      builder: (context, snapshot) {
        final state = snapshot.data ?? controller.state;
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final colorScheme = Theme.of(context).colorScheme;

        final isGenerating = state.isGenerating;
        final isError = state.status == ChapterTtsStatus.error;
        final isPlaying = state.status == ChapterTtsStatus.playing;
        final isPaused = state.status == ChapterTtsStatus.paused;

        final controlColor = isDark ? Colors.white : colorScheme.primary;

        final Widget body;
        if (isGenerating) {
          body = _GeneratingView(state: state, isDark: isDark, colorScheme: colorScheme, voiceTitle: controller.voice.title);
        } else if (isError) {
          body = _ErrorView(error: state.error ?? 'Something went wrong', colorScheme: colorScheme);
        } else {
          final maxMs = state.duration.inMilliseconds <= 0
              ? 1.0
              : state.duration.inMilliseconds.toDouble();
          final valueMs =
              state.position.inMilliseconds.toDouble().clamp(0.0, maxMs);
          body = _PlayerView(
            state: state,
            isDark: isDark,
            colorScheme: colorScheme,
            controlColor: controlColor,
            isPlaying: isPlaying,
            isPaused: isPaused,
            valueMs: valueMs,
            maxMs: maxMs,
            controller: controller,
          );
        }

        final borderSide = BorderSide(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : blue.withValues(alpha: 0.25),
          width: 1.5,
        );

        return Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1A2740) : colorScheme.surface,
            border: Border(
                top: borderSide,
                bottom: borderSide
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.08),
                blurRadius: 16,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
          child: body,
        );
      },
    );
  }

}

String _fmt(Duration d) {
  final h = d.inHours;
  final m = d.inMinutes.remainder(60);
  final s = d.inSeconds.remainder(60);
  String two(int n) => n.toString().padLeft(2, '0');
  return h > 0 ? '${two(h)}:${two(m)}:${two(s)}' : '${two(m)}:${two(s)}';
}

class _GeneratingView extends StatelessWidget {
  final ChapterTtsState state;
  final bool isDark;
  final ColorScheme colorScheme;
  final String voiceTitle;

  const _GeneratingView({
    required this.state,
    required this.isDark,
    required this.colorScheme,
    required this.voiceTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Downloading audio with $voiceTitle voice',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isDark
                ? Colors.white.withValues(alpha: 0.75)
                : colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: state.progress,
                  minHeight: 4,
                  backgroundColor: isDark
                      ? Colors.white.withValues(alpha: 0.12)
                      : blue.withValues(alpha: 0.15),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isDark ? Colors.white : blue,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${state.completedChunks}/${state.totalChunks}',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isDark
                    ? Colors.white.withValues(alpha: 0.7)
                    : colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        if (state.currentChunkLabel != null) ...[
          const SizedBox(height: 6),
          Text(
            state.currentChunkLabel!,
            style: TextStyle(
              fontSize: 11,
              color: isDark
                  ? Colors.white.withValues(alpha: 0.45)
                  : colorScheme.onSurface.withValues(alpha: 0.45),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        const SizedBox(height: 4),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String error;
  final ColorScheme colorScheme;

  const _ErrorView({required this.error, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(Icons.error_outline, size: 16, color: colorScheme.error),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              error,
              style: TextStyle(fontSize: 12, color: colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayerView extends StatelessWidget {
  final ChapterTtsState state;
  final bool isDark;
  final ColorScheme colorScheme;
  final Color controlColor;
  final bool isPlaying;
  final bool isPaused;
  final double valueMs;
  final double maxMs;
  final ChapterTtsPlayerController controller;

  const _PlayerView({
    required this.state,
    required this.isDark,
    required this.colorScheme,
    required this.controlColor,
    required this.isPlaying,
    required this.isPaused,
    required this.valueMs,
    required this.maxMs,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = isPlaying || isPaused;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── progress slider ───────────────────────────────────────────
        SizedBox(
          height: 20,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: blue,
              inactiveTrackColor: isDark
                  ? Colors.white.withValues(alpha: 0.15)
                  : blue.withValues(alpha: 0.18),
              thumbColor: isDark ? Colors.white : blue,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              trackHeight: 3.5,
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(
              value: valueMs,
              max: maxMs,
              onChanged: (v) => controller.seek(Duration(milliseconds: v.toInt())),
            ),
          ),
        ),

        // ── time labels ───────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _fmt(state.position),
                style: TextStyle(
                  fontSize: 11,
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.55)
                      : colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              if (isActive)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: blue.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    isPlaying ? 'Playing' : 'Paused',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white70 : blue,
                    ),
                  ),
                ),
              Text(
                _fmt(state.duration),
                style: TextStyle(
                  fontSize: 11,
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.55)
                      : colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 4),

        // ── controls ──────────────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ControlButton(
              icon: Icons.play_arrow_rounded,
              color: controlColor,
              onPressed: controller.play,
              highlighted: isPlaying,
              isDark: isDark,
            ),
            const SizedBox(width: 8),
            _ControlButton(
              icon: Icons.pause_rounded,
              color: controlColor,
              onPressed: controller.pause,
              highlighted: isPaused,
              isDark: isDark,
            ),
            const SizedBox(width: 8),
            _ControlButton(
              icon: Icons.stop_rounded,
              color: controlColor,
              onPressed: controller.stop,
              highlighted: false,
              isDark: isDark,
            ),
          ],
        ),
      ],
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;
  final bool highlighted;
  final bool isDark;

  const _ControlButton({
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.highlighted,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: highlighted
            ? blue.withValues(alpha: isDark ? 0.3 : 0.12)
            : (isDark
                ? Colors.white.withValues(alpha: 0.07)
                : Colors.black.withValues(alpha: 0.04)),
        border: highlighted
            ? Border.all(
                color: blue.withValues(alpha: isDark ? 0.6 : 0.4), width: 1.5)
            : null,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 24),
        color: color,
        disabledColor: color,
        splashRadius: 24,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
