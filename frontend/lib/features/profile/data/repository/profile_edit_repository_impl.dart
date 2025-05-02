import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/profile/data/datasource/remote/profile_edit_remote_datasource.dart';
import 'package:travel_connector/features/profile/data/mapper/profile_edit_mapper.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_edit_entity.dart';
import 'package:travel_connector/features/profile/domain/repository/profile_edit_repository.dart';

class ProfileEditRepositoryImpl implements ProfileEditRepository {
  final ProfileEditMapper _profileMapper;
  final ProfileEditRemoteDataSource _profileEditRemoteDataSource;
  final ErrorHandler _errorHandler;

  ProfileEditRepositoryImpl(
    this._profileEditRemoteDataSource,
    this._profileMapper,
    this._errorHandler,
  );

  @override
  Future<Either<DomainException, ProfileEditEntity>> executeEdit(
      String? name, String? description, File? avatarFile) async {
    final result = await _profileEditRemoteDataSource.executeEdit(
        name, description, avatarFile);
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
