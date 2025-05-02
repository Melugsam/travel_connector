part of 'post_write_comment_bloc.dart';

sealed class PostWriteCommentState {}

final class PostWriteCommentInitial extends PostWriteCommentState {}

final class PostWriteCommentSuccess extends PostWriteCommentState {
  final PostWritePostCommentEntity comment;

  PostWriteCommentSuccess({required this.comment});
}

final class PostWriteCommentError extends PostWriteCommentState {
  final String message;

  PostWriteCommentError({required this.message});
}

final class PostWriteCommentLoading extends PostWriteCommentState {}