import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_comment_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_comment_mapper.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_comment_repository.dart';

class PostCommentRepositoryImpl implements PostCommentRepository {
  final PostCommentMapper _postCommentMapper;
  final PostCommentRemoteDataSource _commentRemoteDataSource;

  PostCommentRepositoryImpl(
      this._commentRemoteDataSource,
      this._postCommentMapper,
      );

  @override
  Future<List<PostCommentEntity>> fetchPostComments(
      int postId) async {
    try {
      final response = await _commentRemoteDataSource.fetchPostComments(
          postId
      );
      return _postCommentMapper.mapToEntity(response);
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