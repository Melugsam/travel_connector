import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_like_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_like_repository.dart';

class PostLikeUseCase {
  final PostLikeRepository _postLikeRepository;

  PostLikeUseCase(this._postLikeRepository);

  Future<Either<DomainException, PostLikeEntity>> call(
      int userId, int postId) async {
    try {
      final result = await _postLikeRepository.executeLike(
        userId,
        postId,
      );
      return Right(result);
    } on DomainException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GenericDomainException("Неизвестная ошибка"));
    }
  }
}
