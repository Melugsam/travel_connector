import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_mapper.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostMapper _postMapper;
  final PostRemoteDataSource _postRemoteDataSource;

  PostRepositoryImpl(
    this._postRemoteDataSource,
    this._postMapper,
  );

  @override
  Future<List<PostEntity>> fetchPosts(
      int userId, int? offset, int? limit) async {
    try {
      final response = await _postRemoteDataSource.fetchPosts(
        userId,
        offset,
        limit,
      );
      return _postMapper.mapToEntity(response);
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
