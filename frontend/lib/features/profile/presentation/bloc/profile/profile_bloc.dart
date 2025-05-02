import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_entity.dart';
import 'package:travel_connector/features/profile/domain/usecase/profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase _profileUseCase;

  ProfileBloc(this._profileUseCase) : super(ProfileInitial()) {
    on<FetchProfileEvent>(
      (event, emit) async {
        emit(ProfileLoading());
        final result = await _profileUseCase(
          event.targetUserId
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
