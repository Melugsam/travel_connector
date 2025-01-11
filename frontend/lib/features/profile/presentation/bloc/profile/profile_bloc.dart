import 'package:bloc/bloc.dart';
import 'package:travel_connector/core/manager/user_manager.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_entity.dart';
import 'package:travel_connector/features/profile/domain/usecase/profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase _postUseCase;
  final UserManager _userManager;

  ProfileBloc(this._postUseCase, this._userManager) : super(ProfileInitial()) {
    on<FetchProfileEvent>(
      (event, emit) async {
        emit(ProfileLoading());
        final userId = await _userManager.getUserId();
        final result = await _postUseCase(
          userId,
          event.targetUserId??userId,
        );
        result.fold(
          (l) => emit(
            ProfileError(message: l.message),
          ),
          (r) => emit(
            ProfileSuccess(profile: r),
          ),
        );
      },
    );
  }
}
