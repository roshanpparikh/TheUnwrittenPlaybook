import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';

// ── State ────────────────────────────────────────────────────────────────────

class ProfileState {
  final PersonalInfo info;
  final bool isSaving;

  const ProfileState({required this.info, this.isSaving = false});

  ProfileState copyWith({PersonalInfo? info, bool? isSaving}) => ProfileState(
        info: info ?? this.info,
        isSaving: isSaving ?? this.isSaving,
      );
}

// ── Cubit ────────────────────────────────────────────────────────────────────

class ProfileScreenCubit extends Cubit<ProfileState> {
  final UserRepository _userRepo;

  ProfileScreenCubit(UserRepository userRepo, PersonalInfo initialInfo)
      : _userRepo = userRepo,
        super(ProfileState(info: initialInfo));

  Future<void> save(PersonalInfo info) async {
    emit(state.copyWith(isSaving: true));
    await _userRepo.saveUserPersonalInfo(info);
    emit(ProfileState(info: info));
  }
}
