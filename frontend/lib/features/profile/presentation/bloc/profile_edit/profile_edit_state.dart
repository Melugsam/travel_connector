part of 'profile_edit_bloc.dart';

sealed class ProfileEditState {}

final class ProfileEditInitial extends ProfileEditState {}

final class ProfileEditSuccess extends ProfileEditState {
  final ProfileEditEntity profileEdit;

  ProfileEditSuccess({required this.profileEdit});
}

final class ProfileEditError extends ProfileEditState {
  final String message;

  ProfileEditError({required this.message});
}

final class ProfileEditLoading extends ProfileEditState {}