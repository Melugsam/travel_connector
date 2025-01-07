import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/auth/domain/entity/user_entity.dart';
import 'package:travel_connector/features/auth/domain/usecase/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<ExecuteLoginEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await _loginUseCase(event.email, event.password);
      result.fold(
        (l) => emit(LoginError(message: l.message)),
        (r) => emit(
          LoginSuccess(userEntity: r),
        ),
      );
    });
  }
}
