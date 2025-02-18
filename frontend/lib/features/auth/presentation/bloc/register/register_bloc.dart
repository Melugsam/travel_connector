import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/auth/domain/entity/access_entity.dart';
import 'package:travel_connector/features/auth/domain/usecase/register_usecase.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc(this._registerUseCase) : super(RegisterInitial()) {
    on<ExecuteRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      if (event.password != event.confirmPassword) {
        emit(
          RegisterError(message: 'Пароли не совпадают'),
        );
        return;
      }
      final result =
          await _registerUseCase(event.name, event.email, event.password);
      result.fold(
        (failure) => emit(RegisterError(message: failure.message)),
        (accessEntity) => emit(
          RegisterSuccess(accessEntity: accessEntity),
        ),
      );
    });
  }
}
