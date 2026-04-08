import 'package:upwork_the_unwritten_playbook/core/bloc/app_bottom_navigation_pages.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/playbook_part.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

sealed class PageConfiguration {
  static SplashPageConfiguration splash({
    bool complited = false,
    bool enableTransition = false,
  }) => SplashPageConfiguration._(complited, enableTransition);
  // static EmailAuthPageConfiguration emailAuth() =>
  //     EmailAuthPageConfiguration._();
  static OnboardingPageConfiguration get onboarding =>
      OnboardingPageConfiguration._();
  static WelcomePageConfiguration get welcome => WelcomePageConfiguration._();
  static PersonalizationQuizPageConfiguration get personalizationQuiz =>
      PersonalizationQuizPageConfiguration._();
  static SettingsPageConfiguration Function() get settings =>
      SettingsPageConfiguration._;
  static ProfilePageConfiguration get profile => ProfilePageConfiguration._();
  // static HistoryPageConfiguration history() => HistoryPageConfiguration._();
  // workout == null
  //     ? NewWorkoutPageConfiguration._()
  //     : ExistWorkoutPageConfiguration._(workout);
  static HostScreenConfiguration host({
    required AppBottomNavigationPage selectedPage,
  }) => HostScreenConfiguration._(selectedPage);
  factory PageConfiguration.chapter({
    required int number,
    ChapterModel? chapter,
    PlaybookPart? part,
    double? progress,
  }) = ChapterPageConfiguration._;

  static ChapterQuizPageConfiguration quiz(ChapterModel chapter) =>
      ChapterQuizPageConfiguration._(chapter);

  factory PageConfiguration.voiceSelection(TtsVoice? selectedVoice) =
      VoiceSelectionPageConfiguration._;

  final String key;
  final String path;

  const PageConfiguration(this.key, this.path);
}

class SplashPageConfiguration extends PageConfiguration {
  final bool completed;
  final bool enableTransition;
  SplashPageConfiguration._(this.completed, this.enableTransition)
    : super("Splash", "/splash");
}

class OnboardingPageConfiguration extends PageConfiguration {
  OnboardingPageConfiguration._() : super("Onboarding", "/onboarding");
}

class WelcomePageConfiguration extends PageConfiguration {
  WelcomePageConfiguration._() : super("Welcome", "/welcome");
}

class HostScreenConfiguration extends PageConfiguration {
  final AppBottomNavigationPage selectedPage;
  HostScreenConfiguration._(this.selectedPage) : super("Host", "/host");

  @override
  String toString() {
    return 'HostPageConfiguration{selectedPage: $selectedPage}';
  }
}

class AppHasNewVersionPageConfiguration extends PageConfiguration {
  AppHasNewVersionPageConfiguration._() : super("update", "/update");
}

class CredentialsPageConfiguration extends PageConfiguration {
  CredentialsPageConfiguration._() : super("credentials", "/credentials");
}

class SettingsPageConfiguration extends PageConfiguration {
  SettingsPageConfiguration._() : super("Settings", "/settings");
}

class PersonalizationQuizPageConfiguration extends PageConfiguration {
  PersonalizationQuizPageConfiguration._()
    : super("Personalization Quiz", "/personalization-quiz");
}

class ChapterPageConfiguration extends PageConfiguration {
  final int number;
  final ChapterModel? chapter;
  final PlaybookPart? part;
  final double? progress;
  ChapterPageConfiguration._({
    this.chapter,
     this.part,
     this.progress,
     required this.number
  }) : super(
         "Chapter",
         "/chapter/$number",
       );
}

class ChapterQuizPageConfiguration extends PageConfiguration {
  final ChapterModel chapter;
  ChapterQuizPageConfiguration._(this.chapter)
    : super(
        "Quiz: ${chapter.title}",
        "/chapter/${chapter.title.toLowerCase().replaceAll(" ", "-")}/quiz",
      );
}

class ProfilePageConfiguration extends PageConfiguration {
  ProfilePageConfiguration._() : super("Profile", "/profile");
}

class VoiceSelectionPageConfiguration extends PageConfiguration {
  final TtsVoice? selectedVoice;
  VoiceSelectionPageConfiguration._(this.selectedVoice) : super("VoiceSelection", "/voice-selection");
}
