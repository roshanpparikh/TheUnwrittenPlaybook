import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/enum_gender.dart';

part 'personal_info.freezed.dart';
part 'personal_info.g.dart';

@freezed
abstract class PersonalInfo with _$PersonalInfo {
  /// Holds every piece of data collected during the onboarding quiz,
  /// each answer stored as a dedicated typed field.
  const factory PersonalInfo({
    // ── Core identity ────────────────────────────────────────────────────────
    @Default('') String name,

    /// 'male' | 'female' | 'nonbinary'
    Gender? gender,

    // ── Onboarding quiz answers ─────────────────────────────────────────────
    /// 'new_grad' | 'rising' | 'established' | 'executive'
    String? lifeStage,

    /// 'medicine' | 'law' | 'finance' | 'tech' | 'other'
    String? field,

    /// 'fish' | 'some' | 'mostly'
    String? confidence,

    /// Selected interest tags: 'wine' | 'dining' | 'fashion' | 'watches' |
    /// 'cars' | 'art' | 'travel' | 'golf' | 'boats' | 'fitness' | 'money' | 'philanthropy'
    @Default(<String>[]) List<String> interests,

    /// 'central' | 'private' | 'exploring' | 'secular'
    String? faith,

    /// 'now' | 'building' | 'long'
    String? urgency,
  }) = _PersonalInfo;

  const PersonalInfo._();

  factory PersonalInfo.empty() => const PersonalInfo();

  /// Builds a [PersonalInfo] from the flat answers map produced by the
  /// onboarding quiz. Unknown keys are silently ignored.
  factory PersonalInfo.fromAnswers(Map<String, dynamic> answers) {
    final rawGender = answers['gender'] as String?;
    return PersonalInfo(
      name: (answers['name'] as String?)?.trim() ?? '',
      gender: rawGender == null ? null : Gender.values.byName(rawGender),
      lifeStage: answers['life_stage'] as String?,
      field: answers['field'] as String?,
      confidence: answers['confidence'] as String?,
      interests: (answers['interests'] as List?)?.cast<String>() ?? const [],
      faith: answers['faith'] as String?,
      urgency: answers['urgency'] as String?,
    );
  }

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);

  bool get isEmpty => name.isEmpty;
  bool get isNotEmpty => name.isNotEmpty;

  /// True when at least one quiz answer beyond name/gender is present.
  bool get hasAnswers =>
      lifeStage != null ||
          field != null ||
          confidence != null ||
          interests.isNotEmpty ||
          faith != null ||
          urgency != null;
}
