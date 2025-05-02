part of 'follow_bloc.dart';

abstract class FollowState {}

class FollowInitial extends FollowState {}

class FollowLoading extends FollowState {}

class FollowSuccess extends FollowState {
}

class FollowError extends FollowState {
  final String message;

  FollowError(this.message);
}
