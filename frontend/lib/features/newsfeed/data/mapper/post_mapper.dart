import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';

class PostMapper {
  List<PostEntity> mapToEntity(List<PostResponseModel> model) {
    return model
        .map(
          (e) => PostEntity(
            id: e.id,
            description: e.description,
            createdAt: e.createdAt,
            likesCount: e.likesCount,
            commentsCount: e.commentsCount,
            likedBy: e.likedBy,
            liked: e.liked,
            user: PostUserEntity(
              id: e.user.id,
              name: e.user.name,
              avatar: e.user.avatar,
            ),
            images: e.images,
            comments: e.comments
                .map(
                  (comment) => PostCommentEntity(
                    id: comment.id,
                    content: comment.content,
                    createdAt: comment.createdAt,
                    user: PostUserEntity(
                      id: comment.user.id,
                      name: comment.user.name,
                      avatar: comment.user.avatar,
                    ),
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }
}
