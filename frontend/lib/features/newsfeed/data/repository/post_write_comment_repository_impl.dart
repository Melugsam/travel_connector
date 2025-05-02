import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_write_comment_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_write_comment_mapper.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_write_comment_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_write_comment_repository.dart';

class PostWriteCommentRepositoryImpl implements PostWriteCommentRepository {
  final PostWriteCommentMapper _postWriteCommentMapper;
  final PostWriteCommentRemoteDataSource _commentRemoteDataSource;
  final ErrorHandler _errorHandler;

  PostWriteCommentRepositoryImpl(
    this._commentRemoteDataSource,
    this._postWriteCommentMapper,
    this._errorHandler,
  );

  @override
  Future<Either<DomainException,PostWritePostCommentEntity>> executeComment(
     int postId, String content) async {

      final result = await _commentRemoteDataSource.executeComment(
        postId,
        content,
      );
      return result.fold(
            (failure) => Left(
          _errorHandler.handle(failure),
        ),
            (response) => Right(
              _postWriteCommentMapper.mapToEntity(response),
        ),
      );
  }
}
