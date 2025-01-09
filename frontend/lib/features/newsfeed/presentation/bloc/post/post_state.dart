part of 'post_bloc.dart';

sealed class PostState {}

final class PostInitial extends PostState {}

final class PostSuccess extends PostState {
  final List<PostEntity> posts;

  PostSuccess({required this.posts});
}

final class PostError extends PostState {
  final String message;

  PostError({required this.message});
}

final class PostLoading extends PostState {}

final class PostEmpty extends PostState {}
