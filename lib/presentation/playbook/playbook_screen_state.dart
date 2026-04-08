import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/playbook_part.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/tip_model.dart';
import 'package:upwork_the_unwritten_playbook/presentation/playbook/playbook_chapter_item.dart';

part 'playbook_screen_state.freezed.dart';

@freezed
abstract class PlaybookScreenState with _$PlaybookScreenState {
  const PlaybookScreenState._();

  const factory PlaybookScreenState({
    required List<PlaybookPart> parts,
    required Map<String, List<PlaybookChapterItem>> groupedChapters,
    required TipModel? dailyTip,
    required String userName,
    required bool isPersonalized,
    required Set<int> doneChapters,
    required PersonalInfo personalInfo,

    /// progress per chapter 0..1
    required Map<int, double> chapterProgress,
  }) = _PlaybookScreenState;

  factory PlaybookScreenState.initial() => PlaybookScreenState(
    parts: [],
    groupedChapters: {},
    dailyTip: null,
    userName: 'Friend',
    isPersonalized: false,
    doneChapters: <int>{},
    chapterProgress: <int, double>{},
    personalInfo: PersonalInfo.empty()
  );

  int get totalChapters =>
      groupedChapters.values.fold(0, (sum, list) => sum + list.length);
}