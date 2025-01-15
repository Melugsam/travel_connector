import 'dart:io';

import 'package:dio/dio.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/server_error_model.dart';
import 'package:travel_connector/features/profile/data/model/profile_edit_response_model.dart';
import 'package:travel_connector/features/profile/data/service/profile_edit_api_service.dart';

class ProfileEditRemoteDataSource {
  final ProfileEditApiService _profileEditApiService;

  ProfileEditRemoteDataSource(this._profileEditApiService);

  Future<ProfileEditResponseModel> executeEdit(
      int userId, String? name, String? description, File? avatarFile) async {
    try {
      final response = await _profileEditApiService.executeProfileEdit(
        userId,
        name,
        description,
        avatarFile,
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          serverError: ServerErrorModel.fromJson(e.response!.data),
        );
      }
      throw NetworkException();
    } catch (e) {
      throw GenericDataSourceException();
    }
  }
}
