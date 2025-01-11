import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:travel_connector/core/manager/user_manager.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_edit_entity.dart';
import 'package:travel_connector/features/profile/domain/usecase/profile_edit_usecase.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final ProfileEditUseCase _profileEditUseCase;
  final UserManager _userManager;
  ProfileEditBloc(this._userManager, this._profileEditUseCase) : super(ProfileEditInitial()) {
    on<ExecuteEditEvent>((event, emit) async {
      emit(ProfileEditLoading());
      final userId = await _userManager.getUserId();
      final result = await _profileEditUseCase(
        userId,
        event.name,
        event.description,
        event.avatarFile,
      );
      result.fold(
            (l) => emit(
          ProfileEditError(message: l.message),
        ),
            (r) => emit(
          ProfileEditSuccess(profileEdit: r),
        ),
      );
    });
  }
}
