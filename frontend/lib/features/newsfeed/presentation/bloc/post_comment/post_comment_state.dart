part of 'post_comment_bloc.dart';

sealed class PostCommentState {}

final class PostCommentInitial extends PostCommentState {}

final class PostCommentSuccess extends PostCommentState {
  final List<PostCommentEntity> comments;

  PostCommentSuccess({required this.comments});
}

final class PostCommentError extends PostCommentState {
  final String message;

  PostCommentError({required this.message});
}

final class PostCommentLoading extends PostCommentState {}

final class PostCommentEmpty extends PostCommentState {}