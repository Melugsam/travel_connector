import 'package:travel_connector/features/newsfeed/domain/entity/post_write_comment_entity.dart';

abstract class PostWriteCommentRepository{
  Future<PostWritePostCommentEntity> executeComment(int userId, int postId, String content);
}