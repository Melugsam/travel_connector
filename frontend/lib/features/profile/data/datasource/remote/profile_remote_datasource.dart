import 'package:dio/dio.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/server_error_model.dart';
import 'package:travel_connector/features/profile/data/model/profile_request_model.dart';
import 'package:travel_connector/features/profile/data/model/profile_response_model.dart';
import 'package:travel_connector/features/profile/data/service/profile_api_service.dart';

class ProfileRemoteDataSource {
  final ProfileApiService _profileApiService;

  ProfileRemoteDataSource(this._profileApiService);

  Future<ProfileResponseModel> fetchProfile(int userId, int targetUserId) async {
    try {
      final response = await _profileApiService.fetchProfile(
        ProfileRequestModel(userId: userId, targetUserId: targetUserId),
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
