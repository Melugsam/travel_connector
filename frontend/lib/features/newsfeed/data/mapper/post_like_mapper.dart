import 'package:travel_connector/features/newsfeed/data/model/post_like_response_model.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_like_entity.dart';

class PostLikeMapper {
  PostLikeEntity mapToEntity(PostLikeResponseModel response) {
    return PostLikeEntity(
      message: response.message,
      likesCount: response.likesCount,
      likedBy: response.likedBy,
    );
  }
}
