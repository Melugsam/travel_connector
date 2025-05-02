import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_write_comment_entity.freezed.dart';

@freezed
class PostWritePostCommentEntity with _$PostWritePostCommentEntity {
  const factory PostWritePostCommentEntity({
    required String message,
    required int commentId,
  }) = _PostWritePostCommentEntity;
}