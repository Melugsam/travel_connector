import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';

abstract class PostCommentRepository {
  Future<Either<DomainException, List<PostCommentEntity>>> fetchPostComments(int postId);
}
