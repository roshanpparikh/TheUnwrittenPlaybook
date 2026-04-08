import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bottom_navigation_pages.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/navigation_action.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz_result.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/playbook_part.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/user_state_model.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required UserStateModel userState,
    @Default(false) bool isLoading,
    @Default(false) bool isOnboarded,
    PlaybookPart? currentChapterPart,
    required NavigationAction navigationAction,
    @Default(AppBottomNavigationPage.playbook) AppBottomNavigationPage lastNavigatedBottomNavigationPage,
    @Default(false) bool initialized,
    @Default(false) bool onboardingVideoViewed,
    @Default([]) List<ChapterQuizResult> chapterQuizResults
  }) = _AppState;

  // Initial state helper
  factory AppState.initial() => AppState(isLoading: true, navigationAction: NavigationAction.none(), userState: UserStateModel.stub());
}