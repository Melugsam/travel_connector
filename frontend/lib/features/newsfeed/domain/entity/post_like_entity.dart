import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_like_entity.freezed.dart';

@freezed
class PostLikeEntity with _$PostLikeEntity {
  const factory PostLikeEntity({
    required String message,
    required int likesCount,
    required List<int> likedBy,
  }) = _PostLikeEntity;

}
