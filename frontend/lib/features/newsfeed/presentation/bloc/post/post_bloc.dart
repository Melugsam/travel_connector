import 'package:bloc/bloc.dart';
import 'package:travel_connector/core/manager/user_manager.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_usecase.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostUseCase _postUseCase;
  final UserManager _userManager;

  PostBloc(this._postUseCase, this._userManager) : super(PostInitial()) {
    on<FetchPostEvent>((event, emit) async {
      emit(PostLoading());
      final userId = await _userManager.getUserId();
      final result = await _postUseCase(
        event.targetUserId??userId,
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
