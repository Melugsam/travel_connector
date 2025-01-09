part of 'post_like_bloc.dart';

sealed class PostLikeEvent {}

final class ExecuteLikeEvent extends PostLikeEvent{
  final int postId;

  ExecuteLikeEvent({required this.postId});
}