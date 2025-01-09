import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';

abstract class PostCommentRepository {
  Future<List<PostCommentEntity>> fetchPostComments(int postId);
}
