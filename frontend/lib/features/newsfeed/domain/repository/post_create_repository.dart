import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_create_request_model.dart';

abstract class PostCreateRepository {
  Future<Either<DomainException, void>> createPost(PostCreateRequestModel model);
}
