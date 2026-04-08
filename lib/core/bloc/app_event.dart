import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/navigation_action.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';

part 'app_event.freezed.dart';

@freezed
sealed class AppEvent with _$AppEvent {
  const factory AppEvent.initialize() = AppEventInitialize;

  const factory AppEvent.startOnboarding() = AppStartOnboarding;

  const factory AppEvent.completeOnboarding(
      PersonalInfo answers,
      ) = AppCompleteOnboarding;

  const factory AppEvent.resetNavigationAction() = AppEventResetNavigationAction;

  const factory AppEvent.setNavigationAction(
      NavigationAction action, // Replace dynamic with your NavigationAction type
      ) = AppEventSetNavigationAction;

  const factory AppEvent.closeOnboardingVideo(
      bool viewed
      ) = AppEventCloseOnboardingVideo;

}