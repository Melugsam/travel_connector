import 'package:travel_connector/features/newsfeed/data/model/post_write_comment_response_model.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_write_comment_entity.dart';

class PostWriteCommentMapper {
  PostWritePostCommentEntity mapToEntity(PostWriteCommentResponseModel response) {
    return PostWritePostCommentEntity(
      message: response.message,
      commentId: response.commentId,
    );
  }
}
