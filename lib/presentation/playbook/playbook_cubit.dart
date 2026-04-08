import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc_utils/user_state_listener_mixin.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/repository/tips_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/user_state_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/playbook_chapter_item.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/playbook_screen_state.dart';

import '../../domain/models/chapter_model.dart';
import '../../domain/repositories/book_repository.dart';


class PlaybookCubit extends Cubit<PlaybookScreenState> with UserStateListenerMixin {
  final BookRepository _bookRepo;
  final UserRepository _userRepo;
  final TipsRepository _tipsRepository;
  @override
  final UserRepository userRepository;

  PlaybookCubit(this._bookRepo, this._userRepo, this._tipsRepository, this.userRepository)
      : super(PlaybookScreenState.initial()) {
    _userRepo.allChapterProgress.addListener(_progressListener);
    _tipsRepository.tips.addListener(_tipsListener);

    _updateDailyTip();

    initUserStateListener();
  }

  void _tipsListener() {
    _updateDailyTip();
  }

  void _updateDailyTip() {
    final tips = _tipsRepository.tips.value;
    if (tips.isEmpty) return;

    final dailyTip = tips[DateTime.now().day % tips.length];
    emit(state.copyWith(dailyTip: dailyTip));
  }

  void _progressListener() {
    final progress = _userRepo.allChapterProgress.value;
    emit(state.copyWith(chapterProgress: progress));
  }

  /// Called when playbook tab is shown.
  /// If you pass userAnswers/userName/doneChapters explicitly, they win.
  /// Otherwise it loads from UserStateRepository.
  Future<void> load(UserStateModel? userState) async {
    final chapters = await _bookRepo.getChapters();
    final parts = _bookRepo.getParts();

    if(userState == null) {
      final personalInfo = PersonalInfo.empty();
      emit(PlaybookScreenState(
        parts: parts,
        groupedChapters: _group(chapters, personalInfo),
        userName: "",
        dailyTip: null,
        isPersonalized: false,
        doneChapters: {},
        chapterProgress: {},
        personalInfo: personalInfo
      ));
    } else {
      final personalInfo = userState.personalInfo;
      final personalized = _personalize(chapters, personalInfo);
      final grouped = _group(personalized, personalInfo);
      emit(PlaybookScreenState(
        parts: parts,
        groupedChapters: grouped,
        dailyTip: null,
        userName: userState.name,
        isPersonalized: userState.personalInfo.isNotEmpty,
        doneChapters: userState.doneChapters,
        chapterProgress: _userRepo.allChapterProgress.value,
        personalInfo: personalInfo
      ));
    }
  }

  /// ✅ update progress in state (UI can show progress bars)
  void setChapterProgress(int chapterNumber, double progress) {
    final clamped = progress.clamp(0.0, 1.0).toDouble();
    emit(state.copyWith(
      chapterProgress: {...state.chapterProgress, chapterNumber: clamped},
    ));

    if (clamped >= 0.95) {
      markChapterDone(chapterNumber);
    }
  }

  /// Marks a chapter as read without recomputing everything else.
  void markChapterDone(int chapterNumber) {
    emit(state.copyWith(
      doneChapters: {...state.doneChapters, chapterNumber},
      chapterProgress: {
        ...state.chapterProgress,
        chapterNumber: (state.chapterProgress[chapterNumber] ?? 1.0).clamp(0.0, 1.0),
      },
    ));
  }

  // -------------------------------------------------------------------------
  // Private helpers
  // -------------------------------------------------------------------------

  List<ChapterModel> _personalize(
      List<ChapterModel> all,
      PersonalInfo? userAnswers,
      ) {
    if (userAnswers == null) {
      return all.where((c) => c.alwaysInclude).toList();
    }

    final selectedInterests =
        (userAnswers.interests as List?)?.cast<String>() ?? const <String>[];

    final faith = userAnswers.faith;
    final isFaith = faith == 'central' || faith == 'private' || faith == 'exploring';

    return all.where((c) {
      if (c.parentOnly) return false;
      if (c.faithOnly) return isFaith;
      if (c.alwaysInclude) return true;

      return c.interests.isNotEmpty &&
          selectedInterests.any((i) => c.interests.contains(i));
    }).toList();
  }

  Map<String, List<PlaybookChapterItem>> _group(
      List<ChapterModel> chapters,
      PersonalInfo userAnswers,
      ) {
    final selectedInterests =
        (userAnswers?.interests as List?)?.cast<String>() ?? const <String>[];

    final grouped = <String, List<PlaybookChapterItem>>{};

    for (final chapter in chapters) {
      final badge = _badge(chapter, selectedInterests, userAnswers);
      grouped
          .putIfAbsent(chapter.partId, () => [])
          .add(PlaybookChapterItem(chapter: chapter, badge: badge));
    }

    return grouped;
  }

  String? _badge(
      ChapterModel chapter,
      List<String> selectedInterests,
      PersonalInfo? userAnswers,
      ) {
    if (userAnswers == null) return null;

    if (chapter.interests.isNotEmpty &&
        selectedInterests.any((i) => chapter.interests.contains(i))) {
      return 'Priority';
    }

    if (chapter.faithOnly) return 'New';

    return null;
  }

  @override
  Future<void> close() {
    _userRepo.allChapterProgress.removeListener(_progressListener);
    _tipsRepository.tips.removeListener(_tipsListener);

    return super.close();
  }

  @override
  void onCurrentUserChanged(UserStateModel user) async {
    if(state.personalInfo != user.personalInfo) {
      final chapters = await _bookRepo.getChapters();
      final personalized = _personalize(chapters, user.personalInfo);
      final grouped = _group(personalized, user.personalInfo);
      emit(state.copyWith(
          groupedChapters: grouped,
          isPersonalized: user.personalInfo.isNotEmpty,
          personalInfo: user.personalInfo
      ));
    }
  }
}