part of 'register_bloc.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final UserEntity userEntity;

  RegisterSuccess({required this.userEntity});
}

final class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});
}

final class RegisterLoading extends RegisterState {}