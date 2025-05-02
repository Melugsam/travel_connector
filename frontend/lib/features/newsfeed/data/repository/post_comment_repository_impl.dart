import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_comment_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_comment_mapper.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_comment_repository.dart';

class PostCommentRepositoryImpl implements PostCommentRepository {
  final PostCommentMapper _postCommentMapper;
  final PostCommentRemoteDataSource _commentRemoteDataSource;
  final ErrorHandler _errorHandler;

  PostCommentRepositoryImpl(
    this._commentRemoteDataSource,
    this._postCommentMapper,
    this._errorHandler,
  );

  @override
  Future<Either<DomainException, List<PostCommentEntity>>> fetchPostComments(
      int postId) async {
    final result = await _commentRemoteDataSource.fetchPostComments(postId);
    return result.fold(
      (failure) => Left(
        _errorHandler.handle(failure),
      ),
      (response) => Right(
        _postCommentMapper.mapToEntity(response),
      ),
    );
  }
}
