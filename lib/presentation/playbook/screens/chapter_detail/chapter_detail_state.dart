import 'package:upwork_the_unwritten_playbook/domain/models/chapter_content_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz_result.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_detail_state.freezed.dart';

@freezed
sealed class ChapterReaderState with _$ChapterReaderState {
  const factory ChapterReaderState.loading() = ChapterReaderLoading;

  const factory ChapterReaderState.loaded({
    required ChapterModel chapter,
    required ChapterContentModel? content,
    required double progress,
    required bool isFinished,
    ChapterQuizResult? quizResult,
  }) = ChapterReaderLoaded;

  const factory ChapterReaderState.error({
    required String message,
  }) = ChapterReaderError;
}
