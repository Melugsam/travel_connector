import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/profile/data/model/profile_edit_response_model.dart';
import 'package:travel_connector/features/profile/data/service/profile_edit_api_service.dart';

class ProfileEditRemoteDataSource extends BaseRemoteDataSource {
  final ProfileEditApiService _profileEditApiService;

  ProfileEditRemoteDataSource(
      LoggingService loggingService, this._profileEditApiService)
      : super(loggingService: loggingService);

  Future<Either<DataException, ProfileEditResponseModel>> executeEdit(
      String? name, String? description, File? avatarFile) async {
    return safeApiCall(
      () => _profileEditApiService.executeProfileEdit(
        name,
        description,
        avatarFile,
      ),
    );
  }
}
