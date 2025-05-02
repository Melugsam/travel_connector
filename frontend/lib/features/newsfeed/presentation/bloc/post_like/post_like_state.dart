part of 'post_like_bloc.dart';

sealed class PostLikeState {}

final class PostLikeInitial extends PostLikeState {}

final class PostLikeSuccess extends PostLikeState {
  final PostLikeEntity postLike;

  PostLikeSuccess({required this.postLike});
}

final class PostLikeError extends PostLikeState {
  final String message;

  PostLikeError({required this.message});
}

final class PostLikeLoading extends PostLikeState {}


