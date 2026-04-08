import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz_result.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/chapter_quiz_repository.dart';

/// Subscribes to [QuizRepository.progress] and forwards changes to
/// [onQuizProgressChanged].  Automatically unsubscribes when the bloc/cubit
/// is closed.
///
/// Usage:
/// ```dart
/// class MyBloc extends Bloc<MyEvent, MyState>
///     with QuizProgressListenerMixin<MyState> {
///   @override
///   QuizRepository get quizRepository => _quizRepo;
///
///   @override
///   void onQuizProgressChanged(List<ChapterQuizResult> results) { … }
/// }
/// ```
/// Call [initQuizProgressListener] at the end of the constructor body.
mixin QuizProgressListenerMixin<S> on BlocBase<S> {
  QuizRepository get quizRepository;

  void onQuizProgressChanged(List<ChapterQuizResult> results);

  void initQuizProgressListener() {
    quizRepository.progress.addListener(_onProgress);
  }

  void _onProgress() {
    if (!isClosed) onQuizProgressChanged(quizRepository.progress.value);
  }

  @override
  Future<void> close() {
    quizRepository.progress.removeListener(_onProgress);
    return super.close();
  }
}
