import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_like_entity.dart';

abstract class PostLikeRepository {
  Future<Either<DomainException, PostLikeEntity>> executeLike(int postId);
}
