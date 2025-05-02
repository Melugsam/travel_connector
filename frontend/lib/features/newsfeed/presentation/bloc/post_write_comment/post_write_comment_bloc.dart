import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_write_comment_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_write_comment_usecase.dart';

part 'post_write_comment_event.dart';

part 'post_write_comment_state.dart';

class PostWriteCommentBloc extends Bloc<PostWriteCommentEvent, PostWriteCommentState> {
  final PostWriteCommentUseCase _postWriteCommentUseCase;

  PostWriteCommentBloc(this._postWriteCommentUseCase)
      : super(PostWriteCommentInitial()) {
    on<ExecuteWriteCommentEvent>((event, emit) async {
      emit(PostWriteCommentLoading());
      final result = await _postWriteCommentUseCase(
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
