import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_repository.dart';

class PostUseCase {
  final PostRepository _postRepository;

  PostUseCase(this._postRepository);

  Future<Either<DomainException, List<PostEntity>>> call(
      int? offset, int? limit) async {
    return await _postRepository.fetchPosts(
      offset,
      limit,
    );
  }
}
