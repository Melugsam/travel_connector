part of 'post_create_bloc.dart';

abstract class PostCreateState {}

class PostCreateInitial extends PostCreateState {}

class PostCreateLoading extends PostCreateState {}

class PostCreateSuccess extends PostCreateState {}

class PostCreateFailure extends PostCreateState {
  final String errorMessage;

  PostCreateFailure({required this.errorMessage});
}
