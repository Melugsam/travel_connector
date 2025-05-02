import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_create_request_model.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_create_usecase.dart';
import 'package:travel_connector/features/app/presentation/bloc/notification/notification_cubit.dart';

part 'post_create_event.dart';
part 'post_create_state.dart';

class PostCreateBloc extends Bloc<PostCreateEvent, PostCreateState> {
  final PostCreateUseCase useCase;
  final NotificationCubit notificationCubit;

  PostCreateBloc({
    required this.useCase,
    required this.notificationCubit,
  }) : super(PostCreateInitial()) {
    on<SendPostCreateEvent>(_onSendPostCreate);
  }

  Future<void> _onSendPostCreate(
      SendPostCreateEvent event,
      Emitter<PostCreateState> emit,
      ) async {
    emit(PostCreateLoading());

    final result = await useCase(event.model);
    result.fold(
          (error) {
        emit(PostCreateFailure(errorMessage: error.message));
        notificationCubit.showError(message: error.message);
      },
          (_) {
        emit(PostCreateSuccess());
        notificationCubit.showSuccess(message: 'Пост успешно создан');
      },
    );
  }
}
