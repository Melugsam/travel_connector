part of 'session_bloc.dart';

sealed class SessionState {}

final class SessionInitial extends SessionState {}

final class SessionLogout extends SessionState{
  final String message;

  SessionLogout({required this.message});
}