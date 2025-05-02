import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_like_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_like_usecase.dart';

part 'post_like_event.dart';

part 'post_like_state.dart';

class PostLikeBloc extends Bloc<PostLikeEvent, PostLikeState> {
  final PostLikeUseCase _postLikeUseCase;

  PostLikeBloc( this._postLikeUseCase)
      : super(PostLikeInitial()) {
    on<ExecuteLikeEvent>((event, emit) async {
      emit(PostLikeLoading());
      final result = await _postLikeUseCase(event.postId);
      result.fold(
        (l) => emit(
          PostLikeError(message: l.message),
        ),
        (r) => emit(
          PostLikeSuccess(postLike: r),
        ),
      );
    });
  }
}
