part of 'post_write_comment_bloc.dart';

sealed class PostWriteCommentEvent {}

final class ExecuteWriteCommentEvent extends PostWriteCommentEvent {
  final int postId;
  final String content;

  ExecuteWriteCommentEvent({required this.postId, required this.content});

}