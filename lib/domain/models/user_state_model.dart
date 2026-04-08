import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/enum_gender.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_settings.dart';

part 'user_state_model.freezed.dart';

@freezed
abstract class UserStateModel with _$UserStateModel {
  const factory UserStateModel({
    required String? firebaseId,
    required PersonalInfo personalInfo,
    @Default(<int>{}) Set<int> doneChapters,
    int? lastChapter,
    @Default(<String>[]) List<String> recentChatTopics,
    TtsSettings? ttsSettings,
  }) = _UserStateModel;

  const UserStateModel._();

  String get name => personalInfo.name;

  Gender? get gender => personalInfo.gender;

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  factory UserStateModel.stub() =>
      UserStateModel(firebaseId: null, personalInfo: PersonalInfo.empty());

  bool get isStub => personalInfo.isEmpty;
}
