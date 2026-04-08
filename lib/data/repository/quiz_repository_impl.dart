import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upwork_the_unwritten_playbook/data/dto/chapter_quiz_dto.dart';
import 'package:upwork_the_unwritten_playbook/data/source/chapter_quiz_local_data_source.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz_result.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/chapter_quiz_repository.dart';

class ChapterQuizRepositoryImpl implements QuizRepository {
  final QuizLocalDataSource _local;

  ChapterQuizRepositoryImpl(QuizLocalDataSource? local)
      : _local = local ?? const QuizLocalDataSource() {
    _init();
  }

  final ValueNotifier<List<ChapterQuizResult>> _progress = ValueNotifier([]);

  @override
  ValueListenable<List<ChapterQuizResult>> get progress => _progress;

  Future<void> _init() async {
    final list = await _local.readChapterQuizResults();
    print("list: $list");
    _progress.value = List.unmodifiable(list);
  }

  Future<void> _refreshProgress() async {
    final list = await _local.readChapterQuizResults();
    _progress.value = List.unmodifiable(list);
  }

  @override
  Future<List<ChapterQuiz>> loadAll() async {
    final raw = await rootBundle.loadString('assets/json/chapter_quizes.json');
    final decoded = jsonDecode(raw);


    // Support either: { "chapters": [...] } OR just [...]
    final list = (decoded is Map && decoded['chapters'] is List)
        ? (decoded['chapters'] as List)
        : (decoded as List);

    return list
        .map((e) => ChapterQuizDto.fromJson(_preprocessChapter(Map<String, dynamic>.from(e))).toModel())
        .toList();
  }

  /// Normalises each question before DTO parsing:
  /// • Lifts `minLength`/`maxLength` out of a nested `validation` object to
  ///   question level (the DTO expects them there).
  /// • Stamps `isCorrect: true` onto the option whose `id` matches the
  ///   top-level `"answer"` field (String or List).
  Map<String, dynamic> _preprocessChapter(Map<String, dynamic> chapter) {
    final rawQuestions = chapter['questions'];
    if (rawQuestions is! List) return chapter;

    final questions = rawQuestions.map((q) {
      var qMap = Map<String, dynamic>.from(q as Map);

      // Lift minLength / maxLength from nested validation → question level.
      final rawValidation = qMap['validation'];
      if (rawValidation is Map) {
        final vMap = Map<String, dynamic>.from(rawValidation);
        for (final key in ['minLength', 'maxLength']) {
          if (vMap.containsKey(key) && !qMap.containsKey(key)) {
            qMap[key] = vMap.remove(key);
          }
        }
        qMap = {...qMap, 'validation': vMap.isEmpty ? null : vMap};
      }

      // Lift min/max/step/minLabel/maxLabel from nested scale object → question level.
      final rawScale = qMap['scale'];
      if (rawScale is Map) {
        final sMap = Map<String, dynamic>.from(rawScale);
        for (final key in ['min', 'max', 'step']) {
          if (sMap.containsKey(key) && !qMap.containsKey(key)) {
            qMap[key] = sMap[key];
          }
        }
        final labels = sMap['labels'];
        if (labels is Map) {
          final minKey = (qMap['min'] ?? sMap['min'] ?? 1).toString();
          final maxKey = (qMap['max'] ?? sMap['max'] ?? 5).toString();
          if (!qMap.containsKey('minLabel') && labels.containsKey(minKey)) {
            qMap['minLabel'] = labels[minKey];
          }
          if (!qMap.containsKey('maxLabel') && labels.containsKey(maxKey)) {
            qMap['maxLabel'] = labels[maxKey];
          }
        }
      }

      // Stamp isCorrect onto matching options.
      final rawAnswer = qMap['answer'];
      final Set<String> answers = switch (rawAnswer) {
        String s => {s},
        List l => l.whereType<String>().toSet(),
        _ => {},
      };
      if (answers.isNotEmpty) {
        final rawOptions = qMap['options'];
        if (rawOptions is List) {
          qMap['options'] = rawOptions.map((o) {
            final oMap = Map<String, dynamic>.from(o as Map);
            if (answers.contains(oMap['id'])) oMap['isCorrect'] = true;
            return oMap;
          }).toList();
        }
      }

      return qMap;
    }).toList();

    return {...chapter, 'questions': questions};
  }

  @override
  Future<ChapterQuiz> loadByChapterId(int chapterId) async {
    final all = await loadAll();
    return all.firstWhere((q) => q.chapter == chapterId);
  }

  @override
  Future<void> saveChapterQuizResult(int chapterNumber, int score, int total, List<SavedOpenAnswer> openAnswers) async {
    await _local.writeChapterQuizResult(chapterNumber, score, total, openAnswers);
    await _refreshProgress();
  }

  @override
  Future<ChapterQuizResult?> getChapterQuizResult(int chapterNumber) async {
    // Prefer in-memory cache first (fast + avoids disk read)
    final cached = _progress.value;
    final hit = cached.where((e) => e.chapterNumber == chapterNumber).toList();
    if (hit.isNotEmpty) return hit.first;

    // Fallback to disk in case init not finished yet
    final results = await _local.readChapterQuizResults();
    try {
      return results.firstWhere((e) => e.chapterNumber == chapterNumber);
    } catch (_) {
      return null;
    }
  }
}