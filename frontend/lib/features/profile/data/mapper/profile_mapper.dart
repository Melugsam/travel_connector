import 'package:travel_connector/features/newsfeed/data/mapper/post_mapper.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/profile/data/model/profile_response_model.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_entity.dart';

class ProfileMapper {
  final PostMapper postMapper;

  ProfileMapper({required this.postMapper});

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
      posts: postMapper.mapToEntity(model.posts),
    );
  }
}
