import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_mapper.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostMapper _postMapper;
  final PostRemoteDataSource _postRemoteDataSource;
  final ErrorHandler _errorHandler;

  PostRepositoryImpl(
    this._postRemoteDataSource,
    this._postMapper,
    this._errorHandler,
  );

  @override
  Future<Either<DomainException,List<PostEntity>>> fetchPosts(
    int? offset, int? limit) async {

      final result = await _postRemoteDataSource.fetchPosts(
        offset,
        limit,
      );
      return result.fold(
            (failure) => Left(
          _errorHandler.handle(failure),
        ),
            (response) => Right(
              _postMapper.mapToEntity(response),
        ),
      );
  }
}
