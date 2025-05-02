import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_like_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_like_mapper.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_like_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_like_repository.dart';

class PostLikeRepositoryImpl implements PostLikeRepository {
  final PostLikeMapper _postLikeMapper;
  final PostLikeRemoteDataSource _likeRemoteDataSource;
  final ErrorHandler _errorHandler;

  PostLikeRepositoryImpl(
    this._likeRemoteDataSource,
    this._postLikeMapper,
    this._errorHandler,
  );

  @override
  Future<Either<DomainException, PostLikeEntity>> executeLike(
      int postId) async {
    final result = await _likeRemoteDataSource.executeLike(postId);
    return result.fold(
      (failure) => Left(
        _errorHandler.handle(failure),
      ),
      (response) => Right(
        _postLikeMapper.mapToEntity(response),
      ),
    );
  }
}
