import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:upwork_the_unwritten_playbook/core/bloc_utils/quiz_progress_listener_mixin.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz_result.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/book_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/chapter_quiz_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/screens/chapter_detail/chapter_detail_state.dart';

class ChapterReaderCubit extends Cubit<ChapterReaderState>
    with QuizProgressListenerMixin<ChapterReaderState> {
  final BookRepository _bookRepo;
  final UserRepository _userRepo;
  final QuizRepository _quizRepo;

  @override
  QuizRepository get quizRepository => _quizRepo;

  @override
  void onQuizProgressChanged(List<ChapterQuizResult> results) {
    final s = state;
    if (s is! ChapterReaderLoaded) return;
    final chapterNum = s.chapter.number;

    final result = results.where((r) => r.chapterNumber == chapterNum).firstOrNull;
    emit(s.copyWith(quizResult: result));
  }

  ChapterReaderCubit(this._bookRepo, this._userRepo, this._quizRepo)
      : super(const ChapterReaderLoading()) {
    initQuizProgressListener();
  }


  Future<void> load(int number, ChapterModel? chapter, double? progress) async {
    emit(const ChapterReaderLoading());
    try {
      chapter ??= (await _bookRepo.getChapters()).firstWhere((c) => c.number == number);
      progress ??= _userRepo.allChapterProgress.value[number] ?? 0.0;

      final content = await _bookRepo.getChapterContent(chapter.number);

      final userState = _userRepo.currentUser.value;
      final isFinished = userState.doneChapters.contains(chapter.number);

      emit(ChapterReaderLoaded(
        chapter: chapter,
        content: content,
        progress: progress,
        isFinished: isFinished,
        quizResult: null,
      ));

      final offset = await _userRepo.getLastScrollOffset(chapter.number);
      final quizResult = await _quizRepo.getChapterQuizResult(chapter.number);

      emit(ChapterReaderLoaded(
        chapter: chapter,
        content: content,
        progress: progress,
        isFinished: isFinished,
        quizResult: quizResult,
      ));

    } catch (e) {
      emit(ChapterReaderError(message: e.toString()));
    }
  }

  Future<void> updateProgress({
    required double progress,
    required double scrollOffset,
  }) async {
    final s = state;
    if (s is! ChapterReaderLoaded) return;

    final clamped = progress.clamp(0.0, 1.0).toDouble();

    emit(s.copyWith(progress: clamped));

    await _userRepo.setChapterProgress(s.chapter.number, clamped);
    await _userRepo.setLastScrollOffset(s.chapter.number, scrollOffset);

    const finishThreshold = 0.95;
    if (clamped >= finishThreshold && !s.isFinished) {
      await _userRepo.markChapterDone(s.chapter.number);
      final latest = state;
      if (latest is ChapterReaderLoaded) {
        if(isClosed) return;
        emit(latest.copyWith(isFinished: true));
      }
    }
  }
}
