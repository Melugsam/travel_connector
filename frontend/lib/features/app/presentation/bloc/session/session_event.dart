part of 'session_bloc.dart';

sealed class SessionEvent {}

final class LogoutSessionEvent extends SessionEvent {}

final class LoginSessionEvent extends SessionEvent {
  final String accessToken;

  LoginSessionEvent({required this.accessToken});
}

final class AuthenticatedSessionEvent extends SessionEvent {}
