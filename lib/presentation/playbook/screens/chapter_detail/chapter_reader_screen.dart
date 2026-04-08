import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:upwork_the_unwritten_playbook/features/chat/chat_page.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_event.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/app_navigator.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/navigation_action.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/transitions/page_flip_transition.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/context_utils.dart';
import 'package:upwork_the_unwritten_playbook/di/dependency_provider.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_content_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/enum_gender.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/playbook_part.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/book_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/chapter_quiz_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/screens/chapter_detail/chapter_detail_animated_app_bar.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/screens/chapter_detail/chapter_detail_cubit.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/screens/chapter_detail/chapter_detail_state.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/screens/chapter_detail/cheat_sheet_card_widget.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/screens/chapter_detail/for_you_card_widget.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/screens/chapter_detail/insider_detail_card_widget.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/screens/chapter_detail/quiz_status_card_widget.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/screens/chapter_detail/the_key_terms_card_widget.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/screens/chapter_detail/the_move_card_widget.dart';

import 'dart:async';

import 'package:upwork_the_unwritten_playbook/presentation/widgets/app_scaffold.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/use_cases/generate_chapter_speech_use_case.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/use_cases/get_chapter_speech_use_case.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/presentation/chapter_tts_player_controller.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/presentation/chapter_tts_player_widget.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/presentation/cubit/chapter_tts_cubit.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';
import 'package:upwork_the_unwritten_playbook/theme/fit_progress_color_palette.dart';

class SectionTtsRange {
  final int bodyStart;
  final int bodyEnd;

  const SectionTtsRange({required this.bodyStart, required this.bodyEnd});
}

class ChapterReaderScreen extends StatefulWidget {
  final int number;
  final ChapterModel? chapter;
  final PlaybookPart? part;
  final double? progress;

  const ChapterReaderScreen({
    super.key,
    required this.chapter,
    required this.part,
    required this.progress,
    required this.number,
  });

  static Page<dynamic> getPage(ChapterPageConfiguration configuration) {
    final child = ChapterReaderScreen(
      number: configuration.number,
      chapter: configuration.chapter,
      part: configuration.part,
      progress: configuration.progress,
    );
    return PageFlipTransitionPage(
      key: ValueKey(configuration.key),
      child: child,
      name: configuration.path,
      arguments: configuration,
    );
  }

  @override
  State<ChapterReaderScreen> createState() => _ChapterReaderScreenState();
}

class _ChapterReaderScreenState extends State<ChapterReaderScreen> {
  ChapterTtsCubit? _ttsCubit;
  ChapterTtsPlayerController? _controller;

  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  bool _isSpeaking = false;

  Timer? _throttle;

  ChapterReaderCubit? _cubit;

  bool _menuVisible = false;

  static const double _menuWidth = 140;
  static const double _handleWidth = 28;
  static const double _edgeDragAreaWidth = 40;

  void _showMenu() {
    if (!_menuVisible) {
      setState(() => _menuVisible = true);
    }
  }

  void _hideMenu() {
    if (_menuVisible) {
      setState(() => _menuVisible = false);
    }
  }

  bool _chatIsOpened = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cubit ??= ChapterReaderCubit(
      DependencyProvider.get<BookRepository>(),
      DependencyProvider.get<UserRepository>(),
      DependencyProvider.get<QuizRepository>(),
    )..load(widget.number, widget.chapter, widget.progress);
  }

  void _initTtsV2(
    int chapterNumber,
    TtsVoice voice,
    ChapterContentModel content,
    Gender userGender,
  ) {
    _ttsCubit = ChapterTtsCubit(
      getChapterSpeechUseCase:
          DependencyProvider.get<GetChapterSpeechUseCase>(),
      generateChapterSpeechUseCase:
          DependencyProvider.get<GenerateChapterSpeechUseCase>(),
      player: AudioPlayer(),
    );

    _controller = ChapterTtsPlayerController(
      cubit: _ttsCubit!,
      bookId: 'the_unwritten_playbook',
      voice: voice,
      chapterId: chapterNumber.toString(),
    );

    _controller?.initialize(content, userGender);
  }

  @override
  void dispose() {
    _throttle?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _cubit?.close();
    _ttsCubit?.close();
    super.dispose();
  }

  void _onScroll() {
    _throttle?.cancel();
    _throttle = Timer(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      final max = _scrollController.position.maxScrollExtent;
      final off = _scrollController.offset;
      final progress = max <= 0 ? 0.0 : (off / max).clamp(0.0, 1.0).toDouble();
      _cubit?.updateProgress(progress: progress, scrollOffset: off);
    });
  }

  bool _didRestoreOffset = false;

  Future<void> _restoreOffsetIfNeeded(ChapterReaderLoaded state) async {
    if (_didRestoreOffset) return;

    final progress = state.progress;
    if (progress <= 0) {
      _scrollController.addListener(_onScroll);
      return;
    }

    await WidgetsBinding.instance.endOfFrame;
    await WidgetsBinding.instance.endOfFrame;

    if (!mounted || !_scrollController.hasClients) return;

    final maxExtent = _scrollController.position.maxScrollExtent;
    final target = (progress.clamp(0.0, 1.0)) * maxExtent;

    _didRestoreOffset = true;
    _scrollController.jumpTo(target.clamp(0.0, maxExtent));
    _scrollController.addListener(_onScroll);
  }

  void _openQuiz() {
    final chapter = (_cubit?.state as ChapterReaderLoaded?)?.chapter;
    if (chapter == null) return;
    context.navigator.addPage(PageConfiguration.quiz(chapter));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit!,
      child: BlocListener<ChapterReaderCubit, ChapterReaderState>(
        listenWhen: (previous, current) =>
            previous is! ChapterReaderLoaded && current is ChapterReaderLoaded,
        listener: (context, state) {
          if (state is ChapterReaderLoaded) {
            _restoreOffsetIfNeeded(state);
          }
        },
        child: AppScaffold(
          resizeToAvoidBottomInset: true,
          bodyPadding: EdgeInsets.all(0),
          scrolling: false,
          // backgroundColor: navy,
          body: BlocBuilder<ChapterReaderCubit, ChapterReaderState>(
            builder: (context, state) {
              if (state is ChapterReaderLoading) {
                return const Center(child: CircularProgressIndicator());
              }
        
              if (state is ChapterReaderError) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Failed to load chapter.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.message,
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.5),
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _cubit?.load(
                        widget.number,
                        widget.chapter,
                        widget.progress,
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                );
              }
        
              final loaded = state as ChapterReaderLoaded;
        
              final content = loaded.content;
              final sections = content?.sections ?? [];
              final keyTerms = content?.keyTerms ?? [];
              final theMove = content?.theMove ?? '';
              final insiderDetail = content?.insiderDetail ?? '';
              final genderNote =
                  context.read<AppBloc>().state.userState.gender ==
                      Gender.female
                  ? (content?.genderNoteForWomen ?? '')
                  : (content?.genderNoteForMen ?? '');
              final cheatSheet = content?.cheatSheet ?? [];
        
              final bodyStyle = TextStyle(
                fontSize: 15,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.85),
                height: 1.8,
              );
        
              return Column(
                children: [
                  SafeArea(
                    bottom: false,
                    child: AnimatedBuilder(
                      animation: _scrollController,
                      builder: (context, _) {
                        final p = _progressFromScroll();
                        return ChapterDetailAnimatedAppBar(
                          chapter: loaded.chapter,
                          part:
                              widget.part ??
                              DependencyProvider.get<BookRepository>()
                                  .getParts()
                                  .firstWhere(
                                    (p) => p.id == loaded.chapter.partId,
                                  ),
                          progress: p,
                        );
                      },
                    ),
                  ),
                  if (_controller != null && _isSpeaking)
                    ChapterTtsPlayerWidget(controller: _controller!),
                  Expanded(
                    child: ResizableContainer(
                      direction: Axis.vertical,
                      children: [
                        ResizableChild(
                          size: ResizableSize.expand(),
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                controller: _scrollController,
                                padding: const EdgeInsets.fromLTRB(
                                  16,
                                  16,
                                  16,
                                  40,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    ...[
                                      for (
                                        var i = 0;
                                        i < sections.length;
                                        i++
                                      ) ...[
                                        if (sections[i].title.isNotEmpty) ...[
                                          Text(
                                            sections[i].title,
                                            style: TextStyle(
                                              fontFamily: 'Fraunces',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onSurface,
                                              height: 1.3,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                        ],
        
                                        Builder(
                                          builder: (context) {
                                            return RichText(
                                              text: TextSpan(
                                                text: sections[i].body,
                                                style: bodyStyle,
                                              ),
                                            );
                                          },
                                        ),
        
                                        const SizedBox(height: 28),
                                      ],
                                    ],
        
                                    if (keyTerms.isNotEmpty) ...[
                                      KeyTermsCardWidget(keyTerms: keyTerms),
                                      const SizedBox(height: 28),
                                    ],
                                    if (theMove.isNotEmpty) ...[
                                      TheMoveCardWidget(theMove: theMove),
                                      const SizedBox(height: 28),
                                    ],
                                    if (insiderDetail.isNotEmpty) ...[
                                      InsiderDetailCardWidget(
                                        insiderDetail: insiderDetail,
                                      ),
                                      const SizedBox(height: 28),
                                    ],
                                    if (genderNote.isNotEmpty) ...[
                                      ForYouCardWidget(
                                        genderNote: genderNote,
                                      ),
                                      const SizedBox(height: 28),
                                    ],
                                    if (cheatSheet.isNotEmpty) ...[
                                      CheatSheetCardWidget(items: cheatSheet),
                                      const SizedBox(height: 28),
                                    ],
        
                                    Divider(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.08),
                                      height: 1,
                                    ),
                                    const SizedBox(height: 28),
        
                                    QuizStatusCardWidget(
                                      quizResult: loaded.quizResult,
                                      onStartQuiz: _openQuiz,
                                      onRestartQuiz: _openQuiz,
                                    ),
                                  ],
                                ),
                              ),
        
                              // Always-active right edge drag area.
                              Positioned(
                                top: 0,
                                right: 0,
                                bottom: 0,
                                width: _edgeDragAreaWidth,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onHorizontalDragUpdate: (details) {
                                    if (details.delta.dx < -6) {
                                      _showMenu();
                                    } else if (details.delta.dx > 6) {
                                      _hideMenu();
                                    }
                                  },
                                  child: const SizedBox.expand(),
                                ),
                              ),
        
                              if (_menuVisible)
                                Positioned.fill(
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: _hideMenu,
                                    child: const SizedBox.expand(),
                                  ),
                                ),
        
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 220),
                                curve: Curves.easeOut,
                                top: 120,
                                right: _menuVisible
                                    ? 0
                                    : -(_menuWidth - _handleWidth),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap:
                                      () {}, // prevent outside tap layer from firing through menu
                                  onHorizontalDragUpdate: (details) {
                                    if (details.delta.dx > 6) {
                                      _hideMenu();
                                    } else if (details.delta.dx < -6) {
                                      _showMenu();
                                    }
                                  },
                                  child: Material(
                                    elevation: 8,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                    ),
                                    child: Container(
                                      width: _menuWidth,
                                      decoration: BoxDecoration(
                                        color: Colors.black87,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (_menuVisible) {
                                                _hideMenu();
                                              } else {
                                                _showMenu();
                                              }
                                            },
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    16,
                                                  ),
                                                  bottomLeft: Radius.circular(
                                                    16,
                                                  ),
                                                ),
                                            child: Container(
                                              width: _handleWidth,
        
                                              alignment: Alignment.center,
                                              child: Icon(
                                                _menuVisible
                                                    ? Icons.chevron_right
                                                    : Icons.chevron_left,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: AnimatedOpacity(
                                              duration: const Duration(
                                                milliseconds: 150,
                                              ),
                                              opacity: _menuVisible ? 1 : 0,
                                              child: IgnorePointer(
                                                ignoring: !_menuVisible,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                      ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextButton.icon(
                                                        onPressed: () {
                                                          final appBloc =
                                                              context
                                                                  .read<
                                                                    AppBloc
                                                                  >();
                                                          final ttsSettings =
                                                              appBloc
                                                                  .state
                                                                  .userState
                                                                  .ttsSettings;
                                                          if (ttsSettings ==
                                                              null) {
                                                            appBloc.add(
                                                              AppEvent.setNavigationAction(
                                                                NavigationAction.add(
                                                                  PageConfiguration.voiceSelection(
                                                                    null,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            if (_controller ==
                                                                null) {
                                                              final state =
                                                                  _cubit!.state
                                                                      as ChapterReaderLoaded;
                                                              if (appBloc
                                                                          .state
                                                                          .userState
                                                                          .ttsSettings !=
                                                                      null &&
                                                                  state.content !=
                                                                      null) {
                                                                _initTtsV2(
                                                                  widget
                                                                      .number,
                                                                  appBloc
                                                                      .state
                                                                      .userState
                                                                      .ttsSettings!
                                                                      .voice,
                                                                  state
                                                                      .content!,
                                                                  appBloc
                                                                          .state
                                                                          .userState
                                                                          .gender ??
                                                                      Gender
                                                                          .nonbinary,
                                                                );
                                                              }
                                                            }
                                                            setState(() {
                                                              _isSpeaking =
                                                                  !_isSpeaking;
                                                              _menuVisible =
                                                                  false;
                                                            });
                                                          }
                                                        },
                                                        icon: Icon(
                                                          _isSpeaking
                                                              ? Icons
                                                                    .voice_over_off
                                                              : Icons
                                                                    .record_voice_over,
                                                          color: Colors.white,
                                                        ),
                                                        label: const Text(
                                                          'Listening',
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          style: TextStyle(
                                                            color:
                                                                Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton.icon(
                                                        onPressed: () {
                                                          setState(() {
                                                            _chatIsOpened =
                                                                !_chatIsOpened;
                                                            _menuVisible =
                                                                false;
                                                          });
                                                        },
                                                        icon: Icon(
                                                          _chatIsOpened
                                                              ? Icons.close
                                                              : Icons.chat,
                                                          color: Colors.white,
                                                          size: 24,
                                                        ),
                                                        label: const Text(
                                                          'Chat',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          divider: ResizableDivider(
                            thickness: 20,
                            color: context.isDarkMode
                                ? AppColorPalette.electricBlue_50
                                : Theme.of(context).colorScheme.onSurface
                                      .withValues(alpha: 0.08),
                          ),
                        ),
                        if (_chatIsOpened)
                          ResizableChild(
                            size: ResizableSize.pixels(
                              300,
                              max: MediaQuery.of(context).size.height / 2,
                              min: 200,
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16,
                                        right: 8,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Ask question related to this chapter",
                                              style: TextTheme.of(
                                                context,
                                              ).titleMedium,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _chatIsOpened = false;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.close,
                                              color: context.isDarkMode
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ChatPage.chapter(
                                        id: loaded.chapter.number.toString(),
                                      ),
                                    ),
                                  ],
                                ),
                                    
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  child: Transform.translate(
                                    offset: Offset(0, -16),
                                    child: Center(
                                      child: Container(
                                        width: 100,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: context.isDarkMode
                                              ? Theme.of(
                                                  context,
                                                ).scaffoldBackgroundColor
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  double _progressFromScroll() {
    if (!_scrollController.hasClients) return 0.0;
    final max = _scrollController.position.maxScrollExtent;
    if (max <= 0) return 0.0;
    return (_scrollController.offset / max).clamp(0.0, 1.0);
  }

  List<SectionTtsRange> buildSectionRanges(List<ChapterSectionModel> sections) {
    final ranges = <SectionTtsRange>[];
    var offset = 0;

    for (final section in sections) {
      if (section.title.isNotEmpty) {
        offset += section.title.length;
        offset += 2; // title + "\n\n"
      }

      final bodyStart = offset;
      offset += section.body.length;
      final bodyEnd = offset;

      ranges.add(SectionTtsRange(bodyStart: bodyStart, bodyEnd: bodyEnd));

      offset += 2; // body + "\n\n"
    }

    return ranges;
  }

  String buildTtsTextFromSections(List<ChapterSectionModel> sections) {
    final buffer = StringBuffer();

    for (final section in sections) {
      if (section.title.isNotEmpty) {
        buffer.write(section.title);
        buffer.write('\n\n');
      }

      buffer.write(section.body);
      buffer.write('\n\n');
    }

    return buffer.toString().trimRight();
  }

  ({int start, int end})? localHighlightForSection({
    required int globalStart,
    required int globalEnd,
    required SectionTtsRange range,
  }) {
    if (globalStart < 0 || globalEnd <= globalStart) return null;

    final intersects =
        globalStart < range.bodyEnd && globalEnd > range.bodyStart;

    if (!intersects) return null;

    final localStart = (globalStart - range.bodyStart).clamp(
      0,
      range.bodyEnd - range.bodyStart,
    );
    final localEnd = (globalEnd - range.bodyStart).clamp(
      0,
      range.bodyEnd - range.bodyStart,
    );

    if (localEnd <= localStart) return null;

    return (start: localStart, end: localEnd);
  }
}
