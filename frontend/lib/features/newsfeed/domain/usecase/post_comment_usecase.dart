import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_comment_repository.dart';

class PostCommentUseCase {
  final PostCommentRepository _postCommentRepository;

  PostCommentUseCase(this._postCommentRepository);

  Future<Either<DomainException, List<PostCommentEntity>>> call(
      int postId) async {
    return await _postCommentRepository.fetchPostComments(
      postId,
    );
  }
}
