part of 'session_bloc.dart';

sealed class SessionEvent {}

final class LogoutEvent extends SessionEvent {
  final String message;

  LogoutEvent({required this.message});
}