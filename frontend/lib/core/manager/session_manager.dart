import 'package:travel_connector/features/app/presentation/bloc/session_bloc.dart';

class SessionManager {
  final SessionBloc _sessionBloc;

  SessionManager(this._sessionBloc);

  void handleSessionExpired(String message) {
    _sessionBloc.add(LogoutEvent(message: message));
  }
}
