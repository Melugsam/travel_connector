import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_write_comment_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_write_comment_mapper.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_write_comment_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_write_comment_repository.dart';

class PostWriteCommentRepositoryImpl implements PostWriteCommentRepository {
  final PostWriteCommentMapper _postWriteCommentMapper;
  final PostWriteCommentRemoteDataSource _commentRemoteDataSource;

  PostWriteCommentRepositoryImpl(
    this._commentRemoteDataSource,
    this._postWriteCommentMapper,
  );

  @override
  Future<PostWritePostCommentEntity> executeComment(
      int userId, int postId, String content) async {
    try {
      final response = await _commentRemoteDataSource.executeComment(
        userId,
        postId,
        content,
      );
      return _postWriteCommentMapper.mapToEntity(response);
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
