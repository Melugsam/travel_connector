import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/profile/data/datasource/remote/profile_remote_datasource.dart';
import 'package:travel_connector/features/profile/data/mapper/profile_mapper.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_entity.dart';
import 'package:travel_connector/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileMapper _profileMapper;
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final ErrorHandler _errorHandler;

  ProfileRepositoryImpl(
      this._profileRemoteDataSource,
      this._profileMapper,
      this._errorHandler,
      );

  @override
  Future<Either<DomainException,ProfileEntity>> fetchProfile(
      int? targetUserId) async {

      final result = await _profileRemoteDataSource.fetchProfile(
        targetUserId
      );
      return result.fold(
            (failure) => Left(
          _errorHandler.handle(failure),
        ),
            (response) => Right(
          _profileMapper.mapToEntity(response),
        ),
      );
  }
}