part of 'register_bloc.dart';

sealed class RegisterEvent {}

final class ExecuteRegisterEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  ExecuteRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
