import 'package:flutter/foundation.dart';
import 'package:upwork_the_unwritten_playbook/core/logger/app_logger.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/user_state_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_settings.dart';

import '../source/user_state_local_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final AppLogger _logger;
  final UserStateLocalDataSource _local;

  UserRepositoryImpl(
    this._logger, {
    UserStateLocalDataSource? local,
  })  : _local = local ?? const UserStateLocalDataSource() {
    _init();
  }

  Future<void> _init() async {
    final map = await _local.readReadingProgress();
    _progress.value = map;
  }

  final ValueNotifier<Map<int, double>> _progress =
      ValueNotifier<Map<int, double>>(<int, double>{});

  final ValueNotifier<UserStateModel> _currentUser =
      ValueNotifier<UserStateModel>(UserStateModel.stub());

  @override
  ValueListenable<Map<int, double>> get allChapterProgress => _progress;

  @override
  ValueListenable<UserStateModel> get currentUser => _currentUser;

  @override
  Future<UserStateModel> load() async {
    final result = await _load();
    _currentUser.value = result;
    return result;
  }

  Future<UserStateModel> _load() async {
    final answersMap = await _local.readAnswers();

    if (answersMap == null) {
      return UserStateModel.stub();
    }

    final personalInfo = PersonalInfo.fromAnswers(answersMap);
    final done = await _local.readDoneChapters();
    final last = await _local.readLastChapter();
    final topics = await _local.readRecentChatTopics();
    final firebaseId = await _local.readFirebaseId();
    final ttsSettingsRaw = await _local.readTttSetting();
    final ttsSettings = ttsSettingsRaw == null ? null : () {
      try {
        return TtsSettings.fromJson(ttsSettingsRaw);
      } catch (e) {
        debugPrint("Failed parse TtsSettings: $e");
      }
    }();

    var state = UserStateModel(
      personalInfo: personalInfo,
      doneChapters: done,
      lastChapter: last,
      recentChatTopics: topics,
      firebaseId: firebaseId,
      ttsSettings: ttsSettings
    );

    return state;
  }


  @override
  Future<UserStateModel> createUser(PersonalInfo personalInfo) async {
    await _local.writePersonalInfo(personalInfo.toJson());

    var state = UserStateModel(
      personalInfo: personalInfo,
      doneChapters: <int>{},
      lastChapter: null,
      recentChatTopics: const [],
      firebaseId: await _local.readFirebaseId(),
    );

    _currentUser.value = state;
    return state;
  }


  @override
  Future<void> saveUserPersonalInfo(PersonalInfo personalInfo) async {
    await _local.writePersonalInfo(personalInfo.toJson());

    final updatedUser = _currentUser.value.copyWith(personalInfo: personalInfo);

    _currentUser.value = updatedUser;
  }

  @override
  Future<void> markChapterDone(int chapterNumber) async {
    final state = await load();
    await _local.writeDoneChapters({...state.doneChapters, chapterNumber});
  }

  @override
  Future<void> setLastChapter(int? chapterNumber) =>
      _local.writeLastChapter(chapterNumber);

  @override
  Future<void> addRecentChatTopic(String topic, {int max = 10}) async {
    final t = topic.trim();
    if (t.isEmpty) return;

    final state = await load();

    final next = <String>[
      t,
      ...state.recentChatTopics.where(
        (x) => x.toLowerCase() != t.toLowerCase(),
      ),
    ];

    await _local.writeRecentChatTopics(next.take(max).toList());
  }

  @override
  Future<double> getChapterProgress(int chapterNumber) async {
    final map = await _local.readReadingProgress();
    return map[chapterNumber] ?? 0.0;
  }

  @override
  Future<void> setChapterProgress(int chapterNumber, double progress) async {
    final clamped = progress.clamp(0.0, 1.0).toDouble();

    final next = Map<int, double>.from(_progress.value);
    next[chapterNumber] = clamped;
    _progress.value = next;

    await _local.writeReadingProgress(next);

    if (clamped >= 0.95) {
      await markChapterDone(chapterNumber);
      await setLastChapter(chapterNumber);
    }
  }

  @override
  Future<double?> getLastScrollOffset(int chapterNumber) async {
    final map = await _local.readLastScrollOffsets();
    return map[chapterNumber];
  }

  @override
  Future<void> setLastScrollOffset(int chapterNumber, double offset) async {
    final map = await _local.readLastScrollOffsets();
    map[chapterNumber] = offset;
    await _local.writeLastScrollOffsets(map);
  }

  @override
  Future<void> updateReadingProgress({
    required int chapterNumber,
    required double progress,
    required double offset,
  }) async {
    await setChapterProgress(chapterNumber, progress);
    await setLastScrollOffset(chapterNumber, offset);
  }

  @override
  Future<Map<int, double>> getAllChapterProgress() =>
      _local.readReadingProgress();

  @override
  Future<void> clear() => _local.clearAll();

  @override
  Future<bool> getOnboardingVideoViewed() {
    return _local.readOnboardingVideoViewed();
  }

  @override
  Future<void> setOnboardingVideoViewed(bool value) {
    return _local.writeOnboardingVideoViewed(value);
  }

  @override
  Future<void> saveTtsSetting(TtsSettings ttsSetting) async {
    await _local.writeTtsSettings(ttsSetting.toJson());
    _currentUser.value = _currentUser.value.copyWith(ttsSettings: ttsSetting);
  }
}
