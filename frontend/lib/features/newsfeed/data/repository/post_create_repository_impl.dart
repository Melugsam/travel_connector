import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_create_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_create_request_model.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_create_repository.dart';

class PostCreateRepositoryImpl implements PostCreateRepository {
  final PostCreateRemoteDataSource remoteDataSource;
  final ErrorHandler errorHandler;

  PostCreateRepositoryImpl(this.remoteDataSource, this.errorHandler);

  @override
  Future<Either<DomainException, void>> createPost(PostCreateRequestModel model) async {
    final result = await remoteDataSource.createPost(model);
    return result.fold(
          (DataException failure) => Left(errorHandler.handle(failure)),
          (_) => const Right(null),
    );
  }
}
