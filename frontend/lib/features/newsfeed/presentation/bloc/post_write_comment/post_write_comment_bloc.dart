import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_connector/core/manager/user_manager.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_write_comment_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_write_comment_usecase.dart';

part 'post_write_comment_event.dart';

part 'post_write_comment_state.dart';

class PostWriteCommentBloc extends Bloc<PostWriteCommentEvent, PostWriteCommentState> {
  final PostWriteCommentUseCase _postWriteCommentUseCase;
  final UserManager _userManager;

  PostWriteCommentBloc(this._postWriteCommentUseCase, this._userManager)
      : super(PostWriteCommentInitial()) {
    on<ExecuteWriteCommentEvent>((event, emit) async {
      emit(PostWriteCommentLoading());
      final userId = await _userManager.getUserId();
      final result = await _postWriteCommentUseCase(
        userId,
        event.postId,
        event.content,
      );
      result.fold(
        (l) => emit(
          PostWriteCommentError(message: l.message),
        ),
        (r) => emit(
          PostWriteCommentSuccess(comment: r),
        ),
      );
    });
  }
}
