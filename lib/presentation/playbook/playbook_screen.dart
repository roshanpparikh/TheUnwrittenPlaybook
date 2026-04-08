import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_event.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/navigation_action.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_model.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/playbook_chapter_item.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/playbook_screen_state.dart';
import 'package:upwork_the_unwritten_playbook/presentation/tips/widgets/tip_card.dart';

import '../../core/theme/colors.dart';
import '../../domain/models/playbook_part.dart';
import 'playbook_cubit.dart';

class PlaybookScreen extends StatelessWidget {
  const PlaybookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    return BlocBuilder<PlaybookCubit, PlaybookScreenState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.isPersonalized) ...[
                Text(
                  'YOUR PLAYBOOK',
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 3,
                    color: onSurface.withValues(alpha: 0.5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Welcome, ${state.userName}',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: onSurface,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${state.totalChapters} chapters personalized for your journey',
                  style: TextStyle(fontSize: 14, color: onSurface.withValues(alpha: 0.5), height: 1.6),
                ),
                if(state.dailyTip != null) ...[
                  const SizedBox(height: 24),
                  TipCard(
                      isOpened: true,
                      tip: state.dailyTip!),
                ],
                const SizedBox(height: 32),
              ] else ...[
                Text(
                  'Playbook',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: onSurface,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
              ],

              ...state.parts.map((part) {
                final partChapters = state.groupedChapters[part.id];
                if (partChapters == null || partChapters.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PART ${part.number}',
                            style: const TextStyle(
                              fontSize: 11,
                              letterSpacing: 2,
                              color: ember,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            part.title,
                            style: TextStyle(
                              fontFamily: 'Fraunces',
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: onSurface,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...partChapters.map((item) {
                      final progress =
                          state.chapterProgress[item.chapter.number] ?? 0.0;
                      final isFinished = state.doneChapters.contains(
                          item.chapter.number,
                        );    
                      return _ChapterCard(
                        item: item,
                        isDone: isFinished,
                        onTap: () => _openChapter(context, item.chapter, part, progress),
                        progress: progress,
                      );
                    }),
                    const SizedBox(height: 20),
                  ],
                );
              }),
            ],
          ),
        );
      },
    );
  }

  void _openChapter(
    BuildContext context,
    ChapterModel chapter,
    PlaybookPart part,
    double progress
  ) {
    context.read<AppBloc>().add(AppEvent.setNavigationAction(
      NavigationAction.add(
        PageConfiguration.chapter(
          number: chapter.number,
          chapter: chapter,
           part: part,
           progress: progress,
           )
      )
    ));
  }
}


class _ChapterCard extends StatelessWidget {
  final PlaybookChapterItem item;
  final bool isDone;
  final double progress; // 0..1
  final VoidCallback onTap;

  const _ChapterCard({
    required this.item,
    required this.isDone,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isPriority = item.badge == 'Priority';
    final onSurface = Theme.of(context).colorScheme.onSurface;

    final p = progress.clamp(0.0, 1.0);
    final hasProgress = p > 0.0 && !isDone;
    final progressLabel = '${(p * 100).round()}%';

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Opacity(
        opacity: isDone ? 0.6 : 1.0,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: isPriority
                    ? const LinearGradient(
                        colors: [Color(0x15FF6B35), Color(0x08FF6B35)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                border: Border.all(
                  color: isPriority
                      ? const Color(0x30FF6B35)
                      : onSurface.withValues(alpha: 0.08),
                ),
                borderRadius: BorderRadius.circular(12),
                color: isPriority ? null : onSurface.withValues(alpha: 0.04),
              ),
              child: Row(
                children: [
                  Text(
                    '${item.chapter.number}',
                    style: const TextStyle(
                      fontFamily: 'Fraunces',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.chapter.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: onSurface,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item.chapter.readTime} min read',
                          style: TextStyle(fontSize: 12, color: onSurface.withValues(alpha: 0.5)),
                        ),
                      ],
                    ),
                  ),

                  // ✅ right-side indicator: Done ✓ OR progress % OR badge
                  const SizedBox(width: 8),
                  if (isDone) ...[
                    const Text(
                      '✓',
                      style: TextStyle(color: sage, fontSize: 16),
                    ),
                  ] else if (hasProgress) ...[
                    Text(
                      progressLabel,
                      style: const TextStyle(
                        color: sage,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ] else if (item.badge != null) ...[
                    _Badge(label: item.badge!),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;

  const _Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    final isPriority = label == 'Priority';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isPriority ? const Color(0x30FF6B35) : const Color(0x3010B981),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
          color: isPriority ? ember : sage,
        ),
      ),
    );
  }
}
