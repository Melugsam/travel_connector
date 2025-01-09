import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_like_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_like_mapper.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_like_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_like_repository.dart';

class PostLikeRepositoryImpl implements PostLikeRepository {
  final PostLikeMapper _postLikeMapper;
  final PostLikeRemoteDataSource _likeRemoteDataSource;

  PostLikeRepositoryImpl(
      this._likeRemoteDataSource,
      this._postLikeMapper,
      );

  @override
  Future<PostLikeEntity> executeLike(
      int userId, int postId) async {
    try {
      final response = await _likeRemoteDataSource.executeLike(
        userId,
        postId
      );
      return _postLikeMapper.mapToEntity(response);
    } on ServerException catch (e) {
      if (e.serverError.errorCode == 401) {
        throw UnauthorizedException();
      } else if (e.serverError.errorCode == 403) {
        throw PermissionDeniedException();
      } else {
        throw GenericDomainException(e.serverError.details);
      }
    } on NetworkException {
      throw GenericDomainException(
          "Ошибка сети. Проверьте подключение к интернету.");
    } catch (e) {
      throw GenericDomainException(
          "Произошла неизвестная ошибка. Попробуйте позже.");
    }
  }
}