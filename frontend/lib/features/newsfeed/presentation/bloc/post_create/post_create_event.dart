part of 'post_create_bloc.dart';

abstract class PostCreateEvent {}

class SendPostCreateEvent extends PostCreateEvent {
  final PostCreateRequestModel model;

  SendPostCreateEvent(this.model);
}
