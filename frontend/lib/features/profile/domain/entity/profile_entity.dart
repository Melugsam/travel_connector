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
    required bool isFollowing,
    required List<ProfilePostEntity> posts,
  }) = _ProfileEntity;
}


@freezed
class ProfilePostEntity with _$ProfilePostEntity {
  const factory ProfilePostEntity({
    required int id,
    required String description,
    required String createdAt,
    required int likesCount,
    required bool liked,
    required int commentsCount,
    required List<String> images,
  }) = _ProfilePostEntity;
}