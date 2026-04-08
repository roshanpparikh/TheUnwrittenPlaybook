// lib/quiz/data/chapter_quiz_repository.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz_result.dart';
import '../models/chapter_quiz.dart';

abstract class QuizRepository {
  ValueListenable<List<ChapterQuizResult>> get progress;

  Future<List<ChapterQuiz>> loadAll();

  Future<ChapterQuiz> loadByChapterId(int chapterId);

  Future<void> saveChapterQuizResult(int chapterNumber, int score, int total, List<SavedOpenAnswer> openAnswers);
  Future<ChapterQuizResult?> getChapterQuizResult(int chapterNumber);
}