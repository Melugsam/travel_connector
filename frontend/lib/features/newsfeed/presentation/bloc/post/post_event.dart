part of 'post_bloc.dart';

sealed class PostEvent {}

final class FetchPostEvent extends PostEvent {
  final int? userId;
  final int? offset;
  final int? limit;

  FetchPostEvent({
    this.userId,
    this.offset,
    this.limit,
  });
}
