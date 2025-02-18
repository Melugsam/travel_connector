import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/profile/data/model/profile_response_model.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_entity.dart';

class ProfileMapper {
  ProfileEntity mapToEntity(ProfileResponseModel model) {
    return ProfileEntity(
      id: model.id,
      name: model.name,
      avatar: model.avatar,
      description: model.description??'',
      isCurrentUser: model.isCurrentUser,
      isFollowing: model.isFollowing,
      followers: model.followers
          .map(
            (e) => PostUserEntity(
              id: e.id,
              name: e.name,
              avatar: e.avatar,
            ),
          )
          .toList(),
      following: model.following
          .map(
            (e) => PostUserEntity(
              id: e.id,
              name: e.name,
              avatar: e.avatar,
            ),
          )
          .toList(),
      posts: model.posts
          .map(
            (e) => ProfilePostEntity(
              id: e.id,
              description: e.description,
              createdAt: e.createdAt,
              likesCount: e.likesCount,
              liked: e.liked,
              commentsCount: e.commentsCount,
              images: e.images,
            ),
          )
          .toList(),
    );
  }
}
