part of 'login_bloc.dart';

sealed class LoginEvent {}

final class ExecuteLoginEvent extends LoginEvent{
  final String email;
  final String password;

  ExecuteLoginEvent({required this.email, required this.password});
}