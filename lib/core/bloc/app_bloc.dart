import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bottom_navigation_pages.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_event.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_state.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc_utils/quiz_progress_listener_mixin.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc_utils/user_state_listener_mixin.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/navigation_action.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz_result.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/user_state_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/chapter_quiz_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState>
    with QuizProgressListenerMixin<AppState>, UserStateListenerMixin<AppState> {
  final UserRepository _userRepo;
  final QuizRepository _quizRepository;

  @override
  QuizRepository get quizRepository => _quizRepository;

  @override
  UserRepository get userRepository => _userRepo;

  @override
  void onQuizProgressChanged(List<ChapterQuizResult> results) {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(chapterQuizResults: results));
  }

  @override
  void onCurrentUserChanged(UserStateModel user) {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(userState: user));
  }

  PageConfiguration Function()? getCurrentPageConfiguration;

  AppBloc({required UserRepository userRepo, required QuizRepository quizRepo})
    : _userRepo = userRepo, _quizRepository = quizRepo,
      super(AppState.initial()) {
    on<AppCompleteOnboarding>(_onCompleteOnboarding);
    on<AppEventSetNavigationAction>(_onNavigationAction);
    on<AppEventInitialize>(_initialize);
    on<AppEventCloseOnboardingVideo>(_onCloseOnboardingVideo);

    add(AppEvent.initialize());
    initQuizProgressListener();
    initUserStateListener();
  }

  Future<void> _initialize(
    AppEventInitialize event,
    Emitter<AppState> emit,
  ) async {
    try {
      final user = await _userRepo.load();
      final isOnboardingVideoViewed = await _userRepo.getOnboardingVideoViewed();
      emit(
        AppState(
          initialized: true,
          userState: user,
          navigationAction: NavigationAction.none(),
          onboardingVideoViewed: isOnboardingVideoViewed,
        ),
      );
    } catch (_) {
      emit(
        AppState(
          userState: UserStateModel.stub(),
          isOnboarded: false,
          navigationAction: NavigationAction.none(),
        ),
      );
    }
  }

  Future<void> _onCompleteOnboarding(
    AppCompleteOnboarding event,
    Emitter<AppState> emit,
  ) async {
    await _userRepo.createUser(event.answers);

    emit(
      AppState(
        userState: UserStateModel(personalInfo: event.answers, firebaseId: ''),
        isOnboarded: true,
        navigationAction: NavigationAction.replaceAll([
          PageConfiguration.host(
            selectedPage: AppBottomNavigationPage.playbook,
          ),
        ]),
      ),
    );
  }

  void _onNavigationAction(
    AppEventSetNavigationAction event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(navigationAction: event.action));
  }

  void completeOnboarding(PersonalInfo answers) =>
      add(AppEvent.completeOnboarding(answers));

  void _onCloseOnboardingVideo(
    AppEventCloseOnboardingVideo event,
    Emitter<AppState> emit,
  ) async {
    if (event.viewed) {
      await _userRepo.setOnboardingVideoViewed(true);
    }

    emit(
      state.copyWith(
        onboardingVideoViewed: event.viewed,
        navigationAction: NavigationAction.replaceAll([
          state.userState.isStub
              ? PageConfiguration.welcome
              : PageConfiguration.host(
                  selectedPage: AppBottomNavigationPage.playbook,
                ),
        ]),
      ),
    );
  }
}
