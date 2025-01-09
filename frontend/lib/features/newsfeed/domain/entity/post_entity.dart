import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    required int id,
    required String description,
    required String createdAt,
    required int likesCount,
    required bool liked,
    required int commentsCount,
    required List<int> likedBy,
    required PostUserEntity user,
    required List<String> images,
    required List<PostCommentEntity> comments,
  }) = _PostEntity;
}

@freezed
class PostUserEntity with _$PostUserEntity {
  const factory PostUserEntity({
    required int id,
    required String name,
    String? avatar,
  }) = _PostUserEntity;
}

@freezed
class PostCommentEntity with _$PostCommentEntity {
  const factory PostCommentEntity({
    required int id,
    required String content,
    required String createdAt,
    required PostUserEntity user,
  }) = _PostCommentEntity;
}
