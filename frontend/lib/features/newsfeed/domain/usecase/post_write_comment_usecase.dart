import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_write_comment_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_write_comment_repository.dart';

class PostWriteCommentUseCase {
  final PostWriteCommentRepository _postWriteCommentRepository;

  PostWriteCommentUseCase(this._postWriteCommentRepository);

  Future<Either<DomainException, PostWritePostCommentEntity>> call(
      int userId, int postId, String content) async {
    try {
      final result = await _postWriteCommentRepository.executeComment(
        userId,
        postId,
        content,
      );
      return Right(result);
    } on DomainException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GenericDomainException("Неизвестная ошибка"));
    }
  }
}
