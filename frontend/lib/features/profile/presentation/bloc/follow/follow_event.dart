part of 'follow_bloc.dart';

abstract class FollowEvent {}

class FollowToggleEvent extends FollowEvent {
  final int userId;

  FollowToggleEvent(this.userId);
}
