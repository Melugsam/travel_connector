import 'package:bloc/bloc.dart';

part 'session_event.dart';

part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitial()) {
    on<LogoutEvent>((event, emit) {
      emit(SessionLogout(message: event.message));
    });
  }
}
