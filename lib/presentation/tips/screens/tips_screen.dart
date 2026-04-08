import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/book_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/data/daily_fact.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/domain/daily_fact_repository.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/app_navigator.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/domain/notification_settings_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification_service.dart';
import '../../../core/theme/colors.dart';
import '../../../data/tips/repository/tips_repository.dart';
import '../../../di/dependency_provider.dart';
import '../widgets/shimmer.dart';
import '../widgets/tip_card.dart';
import 'tips_cubit.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  int _segmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TipsCubit(
        DependencyProvider.get<TipsRepository>(),
        DependencyProvider.get<UserRepository>(),
        DependencyProvider.get<BookRepository>(),
        DependencyProvider.get<DailyFactRepository>(),
        DependencyProvider.get<NotificationService>(),
        DependencyProvider.get<NotificationSettingsRepository>(),
      ),
      child: BlocListener<TipsCubit, TipsState>(
        listenWhen: (prev, next) {
          if (next is! TipsLoaded) return false;
          if (prev is! TipsLoaded) return true;
          return prev.lastChapterId != next.lastChapterId;
        },
        listener: (context, state) => context.read<TipsCubit>().loadTips(),
        child: BlocBuilder<TipsCubit, TipsState>(
          builder: (context, state) {
            if (state is TipsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final loaded = state as TipsLoaded;
            final isDark = Theme.of(context).brightness == Brightness.dark;

            return Shimmer(
              linearGradient: shimmerGradient,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: CupertinoSlidingSegmentedControl<int>(
                        groupValue: _segmentIndex,
                        padding: const EdgeInsets.all(4),
                        onValueChanged: (i) => setState(() => _segmentIndex = i ?? _segmentIndex),
                        thumbColor: isDark ? Colors.blue.withValues(alpha: 0.15) : Colors.white,
                        children: const {
                          0: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text('💡 Tips', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                          ),
                          1: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text('✨ Facts', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                          ),
                        },
                      ),
                    ),
                  ),
                  if (_segmentIndex == 0)
                    SliverList.builder(
                      itemCount: loaded.tips.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                        child: TipCard(
                          tip: loaded.tips[index],
                          delay: Duration(milliseconds: index * 450),
                        ),
                      ),
                    )
                  else ...[
                    if (loaded.availableInterests.isNotEmpty)
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 36,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            itemCount: loaded.availableInterests.length,
                            separatorBuilder: (_, _) => const SizedBox(width: 8),
                            itemBuilder: (context, index) {
                              final interest = loaded.availableInterests[index];
                              final selected = loaded.selectedInterests.contains(interest);
                              final label = interest[0].toUpperCase() + interest.substring(1);
                              return GestureDetector(
                                onTap: () => context.read<TipsCubit>().toggleFactInterest(interest),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 180),
                                  curve: Curves.easeInOut,
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: selected ? ember : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: selected
                                          ? ember
                                          : Theme.of(context).colorScheme.onSurface.withValues(alpha: isDark ? 0.2 : 0.15),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      label,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: selected
                                            ? Colors.white
                                            : Theme.of(context).colorScheme.onSurface.withValues(alpha: isDark ? 0.6 : 0.55),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),
                    if (loaded.factsLoading)
                      const SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (loaded.filteredFacts.isEmpty)
                      SliverFillRemaining(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  loaded.facts.isEmpty
                                      ? 'No facts yet.\nCheck back after your first daily notification.'
                                      : 'No facts match the selected filters.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
                                    height: 1.6,
                                  ),
                                ),
                                if (loaded.facts.isEmpty && !loaded.notificationsEnabled) ...[
                                  const SizedBox(height: 12),
                                  GestureDetector(
                                    onTap: () => context.navigator.addPage(PageConfiguration.profile),
                                    child: const Text(
                                      'Enable daily fact notifications',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: ember,
                                        decoration: TextDecoration.underline,
                                        decorationColor: ember,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      )
                    else
                      SliverList.builder(
                        itemCount: loaded.filteredFacts.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                          child: _FactCard(fact: loaded.filteredFacts[index], isDark: isDark),
                        ),
                      ),
                  ],
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FactCard extends StatelessWidget {
  final DailyFact fact;
  final bool isDark;

  const _FactCard({required this.fact, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;
    final textTheme = theme.textTheme;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? const [Color(0x1A2D5BFF), Color(0x0DFF6B35)]
                  : const [Color(0x142D5BFF), Color(0x0AFF6B35)],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? const Color(0x252D5BFF) : const Color(0x302D5BFF),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (fact.interests.isNotEmpty) ...[
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: fact.interests
                      .map((interest) => Text(
                            '• ${interest.toUpperCase()}',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                              color: ember,
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 8),
              ],
              Text(
                fact.pushBody,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: onSurface.withValues(alpha: 0.9),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                fact.fullBody,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                  color: onSurface.withValues(alpha: isDark ? 0.65 : 0.6),
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            tooltip: 'Copy',
            visualDensity: VisualDensity.compact,
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(text: '${fact.pushBody}\n\n${fact.fullBody}'),
              );
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: isDark ? const Color(0x1A2D5BFF) : Colors.white,
                  content: Text(
                    'Copied to clipboard',
                    style: TextStyle(color: isDark ? Colors.white : Colors.black),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.copy_rounded,
              size: 18,
              color: onSurface.withValues(alpha: 0.8),
            ),
          ),
        ),
      ],
    );
  }
}
