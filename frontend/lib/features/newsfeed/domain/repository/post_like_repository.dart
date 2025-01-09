import 'package:travel_connector/features/newsfeed/domain/entity/post_like_entity.dart';

abstract class PostLikeRepository {
  Future<PostLikeEntity> executeLike(int userId, int postId);
}
