import 'package:bloc/bloc.dart';
import 'package:travel_connector/core/manager/user_manager.dart';
import 'package:travel_connector/features/auth/domain/entity/user_entity.dart';
import 'package:travel_connector/features/auth/domain/usecase/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final UserManager _userManager;

  LoginBloc(this._loginUseCase, this._userManager) : super(LoginInitial()) {
    on<ExecuteLoginEvent>(
      (event, emit) async {
        emit(LoginLoading());
        final result = await _loginUseCase(event.email, event.password);
        await result.fold(
          (failure) async {
            emit(LoginError(message: failure.message));
          },
          (userEntity) async {
            try {
              await _userManager.saveUserId(userEntity.id);
              emit(LoginSuccess(userEntity: userEntity));
            } catch (e) {
              emit(LoginError(
                  message: "Не удалось сохранить данные. Попробуйте позднее"));
            }
          },
        );
      },
    );
  }
}
