import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz_result.dart';

class UserStateLocalDataSource {
  static const _kAnswers = 'user.answers';
  static const _kDone = 'user.doneChapters';
  static const _kLast = 'user.lastChapter';
  static const _kTopics = 'user.recentChatTopics';

  static const _kProgress = 'user.readingProgressByChapter';
  static const _kScroll = 'user.lastScrollOffsetByChapter';

  static const _kOnboardingVideoViewed = 'user.onboardingVideoViewed';
  static const _kFirebaseId = 'user.firebaseId';

  static const _kTtsSettings = 'user.ttsSettings';

  const UserStateLocalDataSource();

  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  Future<Map<String, dynamic>?> readAnswers() async {
    final p = await _prefs;
    final s = p.getString(_kAnswers);
    if (s == null) return null;
    final decoded = jsonDecode(s);
    if (decoded is Map) return decoded.cast<String, dynamic>();
    return null;
  }

  Future<Set<int>> readDoneChapters() async {
    final p = await _prefs;
    final s = p.getString(_kDone);
    if (s == null) return <int>{};
    final decoded = jsonDecode(s);
    if (decoded is! List) return <int>{};
    final out = <int>{};
    for (final v in decoded) {
      if (v is num) out.add(v.toInt());
    }
    return out;
  }

  Future<int?> readLastChapter() async {
    final p = await _prefs;
    return p.containsKey(_kLast) ? p.getInt(_kLast) : null;
  }

  Future<Map<String,dynamic>?> readTttSetting() async {
    final p = await _prefs;
    final s = p.getString(_kTtsSettings);
    if (s == null) return null;
    final decoded = jsonDecode(s);
    if (decoded is Map) return decoded.cast<String, dynamic>();
    return null;
  }

  Future<void> writeTtsSettings(Map<String, dynamic>? answers) async {
    final p = await _prefs;
    if (answers == null) {
      await p.remove(_kTtsSettings);
    } else {
      await p.setString(_kTtsSettings, jsonEncode(answers));
    }
  }

  Future<List<String>> readRecentChatTopics() async {
    final p = await _prefs;
    final s = p.getString(_kTopics);
    if (s == null) return const <String>[];
    final decoded = jsonDecode(s);
    if (decoded is! List) return const <String>[];
    return decoded.whereType<String>().toList();
  }

  Future<void> writePersonalInfo(Map<String, dynamic>? answers) async {
    final p = await _prefs;
    if (answers == null) {
      await p.remove(_kAnswers);
    } else {
      await p.setString(_kAnswers, jsonEncode(answers));
    }
  }

  Future<void> writeDoneChapters(Set<int> chapters) async {
    final p = await _prefs;
    final list = chapters.toList()..sort();
    await p.setString(_kDone, jsonEncode(list));
  }

  Future<void> writeLastChapter(int? chapterNumber) async {
    final p = await _prefs;
    if (chapterNumber == null) {
      await p.remove(_kLast);
    } else {
      await p.setInt(_kLast, chapterNumber);
    }
  }

  Future<void> writeRecentChatTopics(List<String> topics) async {
    final p = await _prefs;
    await p.setString(_kTopics, jsonEncode(topics));
  }

  Future<void> writeOnboardingVideoViewed(bool value) async {
    final p = await _prefs;
    await p.setBool(_kOnboardingVideoViewed, value);
  }

  Future<bool> readOnboardingVideoViewed() async {
    final p = await _prefs;
    return p.getBool(_kOnboardingVideoViewed) ?? false;
  }


  Future<void> clearAll() async {
    final p = await _prefs;
    await p.remove(_kAnswers);
    await p.remove(_kDone);
    await p.remove(_kLast);
    await p.remove(_kTopics);
    await p.remove(_kProgress);
    await p.remove(_kScroll);
  }

  Future<Map<int, double>> readReadingProgress() async {
    final p = await _prefs;
    final s = p.getString(_kProgress);
    if (s == null) return <int, double>{};
    final decoded = jsonDecode(s);
    if (decoded is! Map) return <int, double>{};
    final out = <int, double>{};
    for (final e in decoded.entries) {
      final k = int.tryParse(e.key.toString());
      final v = e.value;
      if (k == null) continue;
      if (v is num) out[k] = v.toDouble();
    }
    return out;
  }

  Future<void> writeReadingProgress(Map<int, double> progress) async {
    final p = await _prefs;
    final jsonMap = {
      for (final e in progress.entries) e.key.toString(): e.value,
    };
    await p.setString(_kProgress, jsonEncode(jsonMap));
  }
  Future<Map<int, double>> readLastScrollOffsets() async {
    final p = await _prefs;
    final s = p.getString(_kScroll);
    if (s == null) return <int, double>{};
    final decoded = jsonDecode(s);
    if (decoded is! Map) return <int, double>{};
    final out = <int, double>{};
    for (final e in decoded.entries) {
      final k = int.tryParse(e.key.toString());
      final v = e.value;
      if (k == null) continue;
      if (v is num) out[k] = v.toDouble();
    }
    return out;
  }

  Future<void> writeLastScrollOffsets(Map<int, double> offsets) async {
    final p = await _prefs;
    final jsonMap = {
      for (final e in offsets.entries) e.key.toString(): e.value,
    };
    await p.setString(_kScroll, jsonEncode(jsonMap));
  }

  Future<void> writeFirebaseId(String id) async {
    final p = await _prefs;
    await p.setString(_kFirebaseId, id);
  }

  Future<String?> readFirebaseId() async {
    final p = await _prefs;
    return p.getString(_kFirebaseId);
  }
}
