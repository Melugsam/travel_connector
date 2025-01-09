import 'package:bloc/bloc.dart';
import 'package:travel_connector/core/manager/user_manager.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_like_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_like_usecase.dart';

part 'post_like_event.dart';

part 'post_like_state.dart';

class PostLikeBloc extends Bloc<PostLikeEvent, PostLikeState> {
  final UserManager _userManager;
  final PostLikeUseCase _postLikeUseCase;

  PostLikeBloc(this._userManager, this._postLikeUseCase)
      : super(PostLikeInitial()) {
    on<ExecuteLikeEvent>((event, emit) async {
      emit(PostLikeLoading());
      final userId = await _userManager.getUserId();
      final result = await _postLikeUseCase(userId, event.postId);
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
