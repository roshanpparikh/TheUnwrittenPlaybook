import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz_result.dart';

class QuizLocalDataSource {
  static const _kChapterQuizResults = 'user.chapterQuizResults';

  const QuizLocalDataSource();

  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  // ── Read ──────────────────────────────────────────────────────────────────

  Future<List<ChapterQuizResult>> readChapterQuizResults() async {
    final p = await _prefs;
    final s = p.getString(_kChapterQuizResults);
    if (s == null || s.isEmpty) return const <ChapterQuizResult>[];

    dynamic decoded;
    try {
      decoded = jsonDecode(s);
    } catch (_) {
      return const <ChapterQuizResult>[];
    }

    if (decoded is! List) return const <ChapterQuizResult>[];

    final out = <ChapterQuizResult>[];
    for (final item in decoded) {
      try {
        if (item is Map<String, dynamic>) {
          out.add(ChapterQuizResult.fromJson(item));
        } else if (item is Map) {
          out.add(ChapterQuizResult.fromJson(item.cast<String, dynamic>()));
        }
      } catch (e) {}
    }

    // Optional: keep it stable (sorted)
    out.sort((a, b) => a.chapterNumber.compareTo(b.chapterNumber));
    return out;
  }

  // ── Write ─────────────────────────────────────────────────────────────────

  Future<void> writeChapterQuizResult(int chapterNumber, int score, int total, List<SavedOpenAnswer> openAnswers) async {
    final p = await _prefs;

    final existing = (await readChapterQuizResults()).toList();

    final idx = existing.indexWhere((e) => e.chapterNumber == chapterNumber);
    final updated = ChapterQuizResult(
      chapterNumber: chapterNumber,
      score: score,
      total: total,
      openAnswers: openAnswers,
    );

    if (idx >= 0) {
      existing[idx] = updated;
    } else {
      existing.add(updated);
    }

    existing.sort((a, b) => a.chapterNumber.compareTo(b.chapterNumber));

    final jsonList = existing.map((e) => e.toJson()).toList();
    await p.setString(_kChapterQuizResults, jsonEncode(jsonList));
  }

  Future<void> clearAll() async {
    final p = await _prefs;
    await p.remove(_kChapterQuizResults);
  }
}