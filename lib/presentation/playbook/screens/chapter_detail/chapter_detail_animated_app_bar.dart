import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/navigation_action.dart';
import 'package:upwork_the_unwritten_playbook/core/theme/colors.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/playbook_part.dart';

class ChapterDetailAnimatedAppBar extends StatefulWidget {
  final ChapterModel chapter;
  final PlaybookPart part;
  final double progress;

  const ChapterDetailAnimatedAppBar({
    required this.progress,
    required this.chapter,
    required this.part,
    super.key,
  });

  @override
  State<ChapterDetailAnimatedAppBar> createState() => _ChapterDetailAnimatedAppBarState();
}

class _ChapterDetailAnimatedAppBarState extends State<ChapterDetailAnimatedAppBar> {
  double _prev = 0.0;

  static const _kShowMetaUntil = 0.085;
  static const _kBackButtonReservedWidth = 40.0;
  static const _kRightReservedWidth = 30.0;
  static const _kTopSpacing = 10.0;
  static const _kBottomSpacing = 18.0;
  static const _kProgressHeight = 6.0;
  static const _kProgressMetaSpacing = 8.0;
  static const _kTitleGap = 12.0;
  static const _kAnimDuration = Duration(milliseconds: 220);

  @override
  void didUpdateWidget(covariant ChapterDetailAnimatedAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _prev = oldWidget.progress.clamp(0.0, 1.0);
  }

  double _remapCurveAfter(double t, double threshold, Curve curve) {
    if (t <= threshold) return t;
    final r = (t - threshold) / (1.0 - threshold);
    final rCurved = curve.transform(r);
    return threshold + rCurved * (1.0 - threshold);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final target = widget.progress.clamp(0.0, 1.0);
    final showMeta = target <= _kShowMetaUntil;

    final tFast = _remapCurveAfter(
      target,
      _kShowMetaUntil,
      Curves.easeOutCubic,
    );

    final partText =
        'Part ${widget.part.number} · ${widget.part.title} · Ch. ${widget.chapter.number}';
    final chapterTitleText = widget.chapter.title;
    final subtitleText =
        '${widget.chapter.readTime} min read · ${widget.part.subtitle}';

    const partStyle = TextStyle(
      fontSize: 12,
      letterSpacing: 2,
      color: ember,
      fontWeight: FontWeight.w600,
    );

    final chapterTitleStyle = TextStyle(
      fontFamily: 'Fraunces',
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: colorScheme.onSurface,
      height: 1.2,
    );

    final subtitleStyle = TextStyle(
      fontSize: 13,
      color: colorScheme.onSurface.withValues(alpha: 0.5),
    );

    final topMetaOpacity = (1.0 - (target / _kShowMetaUntil)).clamp(0.0, 1.0);
    final titleTopPadding = lerpDouble(8, 0, tFast)!;
    final titleBottomPadding = lerpDouble(0, 2, tFast)!;
    final progressTopPadding = lerpDouble(12, 0, tFast)!;

    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: _kTopSpacing),

            Padding(
              padding: const EdgeInsets.only(
                left: _kBackButtonReservedWidth,
                right: _kRightReservedWidth,
              ),
              child: AnimatedSize(
                duration: _kAnimDuration,
                curve: Curves.easeOutCubic,
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: titleTopPadding,
                    bottom: titleBottomPadding,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSwitcher(
                        duration: _kAnimDuration,
                        switchInCurve: Curves.easeOut,
                        switchOutCurve: Curves.easeIn,
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                              sizeFactor: animation,
                              axisAlignment: -1,
                              child: child,
                            ),
                          );
                        },
                        child: showMeta
                            ? Padding(
                          key: const ValueKey('part-meta'),
                          padding: const EdgeInsets.only(
                            bottom: _kTitleGap,
                          ),
                          child: Opacity(
                            opacity: topMetaOpacity,
                            child: Center(
                              child: Text(
                                partText,
                                textAlign: TextAlign.center,
                                style: partStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        )
                            : const SizedBox.shrink(
                          key: ValueKey('part-meta-hidden'),
                        ),
                      ),
                      Text(
                        chapterTitleText,
                        textAlign: TextAlign.center,
                        style: chapterTitleStyle,
                        maxLines: showMeta ? 2 : 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            AnimatedSize(
              duration: _kAnimDuration,
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: progressTopPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedSwitcher(
                      duration: _kAnimDuration,
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SizeTransition(
                            sizeFactor: animation,
                            axisAlignment: -1,
                            child: child,
                          ),
                        );
                      },
                      child: showMeta
                          ? Padding(
                        key: const ValueKey('subtitle-meta'),
                        padding: const EdgeInsets.only(
                          top: 4,
                          bottom: _kProgressMetaSpacing,
                        ),
                        child: Center(
                          child: Text(
                            subtitleText,
                            style: subtitleStyle,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                          : const SizedBox.shrink(
                        key: ValueKey('subtitle-meta-hidden'),
                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(99),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: _prev, end: target),
                        duration: _kAnimDuration,
                        curve: Curves.easeOut,
                        builder: (context, value, _) {
                          return LinearProgressIndicator(
                            value: value,
                            minHeight: _kProgressHeight,
                            backgroundColor: colorScheme.onSurface.withValues(
                              alpha: 0.08,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: _kBottomSpacing),
          ],
        ),

        Positioned(
          top: 0,
          left: 8,
          child: GestureDetector(
            onTap: () {
              context.read<AppBloc>().add(
                .setNavigationAction(
                  NavigationAction.pop(),
                ),
              );
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
