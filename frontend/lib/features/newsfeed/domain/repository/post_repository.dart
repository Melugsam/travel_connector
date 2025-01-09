import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> fetchPosts(int userId, int? offset, int? limit);
}
