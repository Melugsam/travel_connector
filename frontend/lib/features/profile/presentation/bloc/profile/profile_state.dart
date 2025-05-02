part of 'profile_bloc.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ProfileEntity profile;

  ProfileSuccess({required this.profile});
}

final class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}

final class ProfileLoading extends ProfileState {}
