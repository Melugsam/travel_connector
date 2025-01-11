part of 'profile_edit_bloc.dart';

sealed class ProfileEditEvent {}

final class ExecuteEditEvent extends ProfileEditEvent{
  final String name;
  final String description;
  final File avatarFile;

  ExecuteEditEvent({required this.name, required this.description, required this.avatarFile});
}