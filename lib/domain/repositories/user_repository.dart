import 'package:flutter/foundation.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/user_state_model.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_settings.dart';

abstract class UserRepository {
  Future<UserStateModel> load();

  Future<void> saveUserPersonalInfo(PersonalInfo personalInfo);

  Future<UserStateModel> createUser(PersonalInfo personalInfo);

  Future<void> markChapterDone(int chapterNumber);

  Future<void> setLastChapter(int? chapterNumber);

  Future<void> addRecentChatTopic(String topic, {int max = 10});


  Future<double> getChapterProgress(int chapterNumber);
  Future<void> setChapterProgress(int chapterNumber, double progress);

  Future<double?> getLastScrollOffset(int chapterNumber);
  Future<void> setLastScrollOffset(int chapterNumber, double offset);

  Future<void> updateReadingProgress({
    required int chapterNumber,
    required double progress,
    required double offset,
  });

  Future<Map<int, double>> getAllChapterProgress();

  ValueListenable<Map<int, double>> get allChapterProgress;
  ValueListenable<UserStateModel> get currentUser;

  Future<void> clear();

  Future<void> setOnboardingVideoViewed(bool value);
  Future<bool> getOnboardingVideoViewed();

  Future<void> saveTtsSetting(TtsSettings ttsSetting);
}
