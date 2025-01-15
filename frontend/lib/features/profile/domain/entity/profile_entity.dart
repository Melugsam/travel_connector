import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';

part 'profile_entity.freezed.dart';

@freezed
class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required int id,
    required String name,
    required String description,
    String? avatar,
    required List<PostUserEntity> followers,
    required List<PostUserEntity> following,
    required bool isCurrentUser,
    required bool currentUserFollowing,
  }) = _ProfileEntity;
}