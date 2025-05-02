import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_usecase.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostUseCase _postUseCase;

  PostBloc(this._postUseCase) : super(PostInitial()) {
    on<FetchPostEvent>((event, emit) async {
      emit(PostLoading());
      final result = await _postUseCase(
        event.offset,
        event.limit,
      );
      result.fold(
          (l) => emit(
                PostError(message: l.message),
              ), (r) {
        if (r.isEmpty) {
          emit(PostEmpty());
        } else {
          emit(
            PostSuccess(posts: r),
          );
        }
      });
    });
  }
}
