part of 'post_bloc.dart';

sealed class PostEvent {}

final class FetchPostEvent extends PostEvent {
  final int? targetUserId;
  final int? offset;
  final int? limit;

  FetchPostEvent({
    this.targetUserId,
    this.offset,
    this.limit,
  });
}
