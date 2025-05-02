part of 'profile_bloc.dart';

sealed class ProfileEvent {}

final class FetchProfileEvent extends ProfileEvent{
  final int? targetUserId;

  FetchProfileEvent({required this.targetUserId});
}