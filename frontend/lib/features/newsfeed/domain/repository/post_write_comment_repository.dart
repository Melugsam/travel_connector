import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_write_comment_entity.dart';

abstract class PostWriteCommentRepository{
  Future<Either<DomainException,PostWritePostCommentEntity>> executeComment(int postId, String content);
}