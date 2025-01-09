part of 'post_comment_bloc.dart';

sealed class PostCommentEvent {}

final class FetchCommentEvent extends PostCommentEvent {
  final int postId;

  FetchCommentEvent({required this.postId});

}