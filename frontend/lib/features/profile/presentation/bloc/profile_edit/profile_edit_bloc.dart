import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_edit_entity.dart';
import 'package:travel_connector/features/profile/domain/usecase/profile_edit_usecase.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final ProfileEditUseCase _profileEditUseCase;
  ProfileEditBloc(this._profileEditUseCase) : super(ProfileEditInitial()) {
    on<ExecuteEditEvent>((event, emit) async {
      emit(ProfileEditLoading());
      final result = await _profileEditUseCase(
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
