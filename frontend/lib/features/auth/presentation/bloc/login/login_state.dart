part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final AccessEntity accessEntity;

  LoginSuccess({required this.accessEntity});
}

final class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}

final class LoginLoading extends LoginState {}
