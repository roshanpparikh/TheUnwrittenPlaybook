import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/user_state_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';

/// Subscribes to [UserRepository.currentUser] and forwards changes to
/// [onCurrentUserChanged]. Automatically unsubscribes when the bloc/cubit
/// is closed.
///
/// Usage:
/// ```dart
/// class MyBloc extends Bloc<MyEvent, MyState>
///     with UserStateListenerMixin<MyState> {
///   @override
///   UserRepository get userRepository => _userRepo;
///
///   @override
///   void onCurrentUserChanged(UserStateModel user) { … }
/// }
/// ```
/// Call [initUserStateListener] at the end of the constructor body.
mixin UserStateListenerMixin<S> on BlocBase<S> {
  UserRepository get userRepository;

  void onCurrentUserChanged(UserStateModel user);

  void initUserStateListener() {
    userRepository.currentUser.addListener(_onUserChanged);
  }

  void _onUserChanged() {
    if (!isClosed) onCurrentUserChanged(userRepository.currentUser.value);
  }

  @override
  Future<void> close() {
    userRepository.currentUser.removeListener(_onUserChanged);
    return super.close();
  }
}
