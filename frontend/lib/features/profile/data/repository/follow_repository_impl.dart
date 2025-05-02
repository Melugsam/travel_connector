

import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/profile/data/datasource/remote/follow_remote_datasource.dart';
import 'package:travel_connector/features/profile/domain/repository/follow_repository.dart';

class FollowRepositoryImpl implements FollowRepository {
  final FollowRemoteDataSource remoteDataSource;
  final ErrorHandler _errorHandler;

  FollowRepositoryImpl(this.remoteDataSource, this._errorHandler);

  @override
  Future<Either<DomainException,void>> follow(
      int targetUserId) async {

    final result = await remoteDataSource.fetchFollow(
        targetUserId
    );
    return result.fold(
          (failure) => Left(
        _errorHandler.handle(failure),
      ),
          (response) => Right(
        response
      ),
    );
  }
}
