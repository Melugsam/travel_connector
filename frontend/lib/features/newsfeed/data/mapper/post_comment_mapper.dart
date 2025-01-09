import 'package:travel_connector/features/newsfeed/data/model/post_comment_response_model.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';

class PostCommentMapper {
  List<PostCommentEntity> mapToEntity(PostCommentResponseModel response) {
    return response.comments
        .map(
          (e) => PostCommentEntity(
            id: e.id,
            content: e.content,
            createdAt: e.createdAt,
            user: PostUserEntity(
              id: e.user.id,
              name: e.user.name,
              avatar: e.user.avatar,
            ),
          ),
        )
        .toList();
  }
}
