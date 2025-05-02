import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/profile/data/model/profile_request_model.dart';
import 'package:travel_connector/features/profile/data/model/profile_response_model.dart';
import 'package:travel_connector/features/profile/data/service/profile_api_service.dart';

class ProfileRemoteDataSource extends BaseRemoteDataSource {
  final ProfileApiService _profileApiService;

  ProfileRemoteDataSource(this._profileApiService)
      : super();

  Future<Either<DataException, ProfileResponseModel>> fetchProfile(
      int? targetUserId) async {
    return safeApiCall(
      () => _profileApiService.fetchProfile(
        ProfileRequestModel(targetUserId: targetUserId),
      ),
    );
  }
}
