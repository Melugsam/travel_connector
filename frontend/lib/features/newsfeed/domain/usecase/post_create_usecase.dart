import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_create_request_model.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_create_repository.dart';

class PostCreateUseCase {
  final PostCreateRepository repository;

  PostCreateUseCase(this.repository);

  Future<Either<DomainException, void>> call(PostCreateRequestModel model) {
    return repository.createPost(model);
  }
}
