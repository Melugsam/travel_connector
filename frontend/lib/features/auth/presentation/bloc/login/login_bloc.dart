import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/auth/domain/entity/access_entity.dart';
import 'package:travel_connector/features/auth/domain/usecase/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<ExecuteLoginEvent>(
      (event, emit) async {
        emit(LoginLoading());
        final result = await _loginUseCase(
          event.email,
          event.password,
        );
        await result.fold(
          (failure) async {
            emit(LoginError(message: failure.message));
          },
          (accessEntity) async {
            try {
              emit(
                LoginSuccess(
                  accessEntity: accessEntity,
                ),
              );
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
