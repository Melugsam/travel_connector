import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_comment_usecase.dart';

part 'post_comment_event.dart';

part 'post_comment_state.dart';

class PostCommentBloc extends Bloc<PostCommentEvent, PostCommentState> {
  final PostCommentUseCase _postCommentUseCase;

  PostCommentBloc(this._postCommentUseCase) : super(PostCommentInitial()) {
    on<FetchCommentEvent>((event, emit) async {
      emit(PostCommentLoading());
      final result = await _postCommentUseCase(
        event.postId
      );
      result.fold(
        (l) => emit(
          PostCommentError(message: l.message),
        ),
        (r) => emit(
          PostCommentSuccess(comments: r),
        ),
      );
    });
  }
}
