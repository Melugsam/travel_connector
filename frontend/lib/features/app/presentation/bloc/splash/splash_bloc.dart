import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_connector/features/profile/domain/usecase/profile_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final ProfileUseCase _profileUseCase;
  SplashBloc(this._profileUseCase) : super(SplashInitial()) {
    on<CheckSessionEvent>((event, emit) async {
      final result = await _profileUseCase(null);
      result.fold(
            (failure) => emit(
              SplashError(),
        ),
            (profile) => emit(
              SplashSuccess(),
        ),
      );
    });
  }
}
