import 'package:bloc/bloc.dart';
import 'package:travel_connector/core/manager/token_manager.dart';
import 'package:travel_connector/features/profile/domain/usecase/profile_usecase.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final TokenManager _tokenManager;

  SessionBloc(this._tokenManager)
      : super(SessionInitial()) {
    on<LogoutSessionEvent>(
      (event, emit) async {
        emit(SessionLogout());
      },
    );

    on<LoginSessionEvent>(
      (event, emit) async {
        await _tokenManager.saveAccessToken(event.accessToken);
        emit(SessionAuthenticated());
      },
    );

    on<AuthenticatedSessionEvent>(
          (event, emit) async {
        emit(SessionAuthenticated());
      },
    );
  }
}
