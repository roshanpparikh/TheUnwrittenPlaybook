import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz_result.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/quiz_question.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/chapter_quiz_repository.dart';

// ── State ─────────────────────────────────────────────────────────────────────

sealed class QuizScreenState {
  const QuizScreenState();
}

class QuizScreenLoading extends QuizScreenState {
  const QuizScreenLoading();
}

class QuizScreenQuestion extends QuizScreenState {
  final ChapterQuiz quiz;
  final int index;
  final int score;

  /// IDs of the options the user has tapped so far.
  /// Empty means nothing selected yet.
  final Set<String> selectedOptionIds;

  /// True once the answer is locked in (for multi: after explicit Submit).
  final bool submitted;

  /// Collected answers for text/scale questions (questionId → SavedOpenAnswer).
  final Map<String, SavedOpenAnswer> openAnswers;

  const QuizScreenQuestion({
    required this.quiz,
    required this.index,
    required this.score,
    this.selectedOptionIds = const {},
    this.submitted = false,
    this.openAnswers = const {},
  });

  bool get answered => submitted;
  bool get isLast => index == quiz.questions.length - 1;

  QuizScreenQuestion copyWith({
    int? index,
    int? score,
    Set<String>? selectedOptionIds,
    bool? submitted,
    Map<String, SavedOpenAnswer>? openAnswers,
  }) =>
      QuizScreenQuestion(
        quiz: quiz,
        index: index ?? this.index,
        score: score ?? this.score,
        selectedOptionIds: selectedOptionIds ?? this.selectedOptionIds,
        submitted: submitted ?? this.submitted,
        openAnswers: openAnswers ?? this.openAnswers,
      );
}

class QuizScreenResult extends QuizScreenState {
  final ChapterQuiz quiz;
  final int score;
  const QuizScreenResult({required this.quiz, required this.score});
}

class QuizScreenError extends QuizScreenState {
  final String message;
  const QuizScreenError(this.message);
}

// ── Cubit ─────────────────────────────────────────────────────────────────────

class QuizScreenCubit extends Cubit<QuizScreenState> {
  final QuizRepository _quizRepo;
  final ChapterModel _chapter;

  QuizScreenCubit({
    required QuizRepository quizRepo,
    required ChapterModel chapter,
  })  : _quizRepo = quizRepo,
        _chapter = chapter,
        super(const QuizScreenLoading()) {
    load();
  }

  Future<void> load() async {
    emit(const QuizScreenLoading());
    try {
      final raw = await _quizRepo.loadByChapterId(_chapter.number);
      final rng = Random();
      final shuffled = raw.questions.map((q) => q.maybeMap(
        single: (sq) => sq.copyWith(options: sq.options.toList()..shuffle(rng)),
        multi: (mq) => mq.copyWith(options: mq.options.toList()..shuffle(rng)),
        scenario: (sq) => sq.copyWith(options: sq.options.toList()..shuffle(rng)),
        orElse: () => q,
      )).toList();
      final quiz = raw.copyWith(questions: shuffled);
      emit(QuizScreenQuestion(quiz: quiz, index: 0, score: 0));
    } catch (e, st) {
      debugPrintStack(stackTrace: st, label: e.toString());
      emit(QuizScreenError(e.toString()));
    }
  }

  void selectAnswer(String optionId) {

    final s = state;
    if (s is! QuizScreenQuestion || s.submitted) return;

    final q = s.quiz.questions[s.index];

    q.map(
      single: (_) => _submitSingleOrScenario(s, q, optionId),
      scenario: (_) => _submitSingleOrScenario(s, q, optionId),
      multi: (m) => _toggleMulti(s, m, optionId),
      text: (t) => _submitText(s, t, optionId),
      scale: (sq) {
        final updated = Map<String, SavedOpenAnswer>.from(s.openAnswers);
        updated[sq.id] = SavedOpenAnswer(
          questionId: sq.id,
          prompt: sq.prompt,
          type: 'scale',
          answer: optionId,
        );
        emit(s.copyWith(submitted: true, openAnswers: updated));
      },
    );
  }

  void _submitText(QuizScreenQuestion s, TextQuestion q, String answer) {

    // Optional custom validation rule (adjust to your ValidationRule model)
    final rule = q.validation;
    if (rule != null) {
      final ok = true;// _validateTextByRule(rule, v);
      if (!ok) return;
    }

    final updated = Map<String, SavedOpenAnswer>.from(s.openAnswers);
    updated[q.id] = SavedOpenAnswer(
      questionId: q.id,
      prompt: q.prompt,
      type: 'text',
      answer: answer,
    );

    emit(s.copyWith(submitted: true, openAnswers: updated));
  }

  void _submitSingleOrScenario(QuizScreenQuestion s, QuizQuestion q, String optionId) {
    final correct = _isSingleCorrect(q, optionId);
    emit(s.copyWith(
      selectedOptionIds: {optionId},
      submitted: true,
      score: correct ? s.score + 1 : s.score,
    ));
  }

  void _toggleMulti(QuizScreenQuestion s, MultiQuestion q, String optionId) {
    final selected = Set<String>.from(s.selectedOptionIds);

    if (selected.contains(optionId)) {
      selected.remove(optionId);
    } else {
      // enforce pick limit (default 2)
      if (selected.length >= q.pick) return;
      selected.add(optionId);
    }

    // optionally auto-submit when reached pick
    final shouldAutoSubmit = selected.length == q.pick;

    emit(s.copyWith(
      selectedOptionIds: selected,
      submitted: shouldAutoSubmit ? true : false,
      score: shouldAutoSubmit
          ? s.score + (_isMultiCorrect(q, selected) ? 1 : 0)
          : s.score,
    ));
  }

  bool _isMultiCorrect(MultiQuestion q, Set<String> selectedIds) {
    final correctIds = q.options
        .where((o) => o.isCorrect ?? false) // <- adjust if your model differs
        .map((o) => o.id)
        .toSet();

    // must match exactly
    return selectedIds.length == correctIds.length &&
        selectedIds.containsAll(correctIds);
  }

  /// For multi questions: toggles an option without locking in.
  /// No-op if already submitted.
  void toggleOption(String optionId) {
    final s = state;
    if (s is! QuizScreenQuestion || s.submitted) return;
    final selected = Set<String>.from(s.selectedOptionIds);
    if (selected.contains(optionId)) {
      selected.remove(optionId);
    } else {
      selected.add(optionId);
    }
    emit(s.copyWith(selectedOptionIds: selected));
  }

  /// Locks in the current multi-selection and scores it.
  /// No-op if already submitted.
  void submitMulti() {
    final s = state;
    if (s is! QuizScreenQuestion || s.submitted) return;
    final correct = s.quiz.questions[s.index].maybeMap(
      multi: (mq) {
        final correctIds =
            mq.options.where((o) => o.isCorrect == true).map((o) => o.id).toSet();
        return s.selectedOptionIds.length == correctIds.length &&
            s.selectedOptionIds.every(correctIds.contains);
      },
      orElse: () => false,
    );
    emit(s.copyWith(
      submitted: true,
      score: correct ? s.score + 1 : s.score,
    ));
  }

  bool _isSingleCorrect(QuizQuestion q, String optionId) => q.maybeMap(
        single: (sq) =>
            sq.options.any((o) => o.id == optionId && o.isCorrect == true),
        scenario: (sq) =>
            sq.options.any((o) => o.id == optionId && o.isCorrect == true),
        orElse: () => false,
      );

  /// Advances to the next question, or saves the result and shows the
  /// results screen when the last question is answered.
  Future<void> next() async {
    final s = state;
    if (s is! QuizScreenQuestion || !s.answered) return;

    if (!s.isLast) {
      emit(s.copyWith(
        index: s.index + 1,
        selectedOptionIds: {},
        submitted: false,
      ));
      return;
    }

    final scoreableCount = s.quiz.questions
        .where((q) => q.maybeMap(text: (_) => false, scale: (_) => false, orElse: () => true))
        .length;

    await _quizRepo.saveChapterQuizResult(
      _chapter.number,
      s.score,
      scoreableCount,
      s.openAnswers.values.toList(),
    );
    emit(QuizScreenResult(quiz: s.quiz, score: s.score));
  }

  void reset() {
    final s = state;
    if (s is QuizScreenResult) {
      emit(QuizScreenQuestion(quiz: s.quiz, index: 0, score: 0));
    }
  }
}
