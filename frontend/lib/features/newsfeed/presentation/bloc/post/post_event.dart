part of 'post_bloc.dart';

sealed class PostEvent {}

final class FetchPostEvent extends PostEvent {
  final int? offset;
  final int? limit;

  FetchPostEvent({
    this.offset,
    this.limit,
  });
}
