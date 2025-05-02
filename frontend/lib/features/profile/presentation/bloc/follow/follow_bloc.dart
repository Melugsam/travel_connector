import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/features/profile/domain/usecase/follow_usecase.dart';

part 'follow_event.dart';
part 'follow_state.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  final FollowUseCase useCase;

  FollowBloc(this.useCase) : super(FollowInitial()) {
    on<FollowToggleEvent>((event, emit) async {
      emit(FollowLoading());
      try {
         await useCase.call(event.userId);
        emit(FollowSuccess());
      } catch (_) {
        emit(FollowError("Не удалось выполнить действие"));
      }
    });
  }
}
