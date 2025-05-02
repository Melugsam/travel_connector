import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/features/profile/data/model/follow_request_model.dart';
import 'package:travel_connector/features/profile/data/service/follow_api_service.dart';

class FollowRemoteDataSource extends BaseRemoteDataSource {
  final FollowApiService _followApiService;

  FollowRemoteDataSource(this._followApiService)
      : super();

  Future<Either<DataException, void>> fetchFollow(
      int targetUserId) async {
    return safeApiCall(
          () => _followApiService.follow(
        FollowRequestModel(targetId: targetUserId),
      ),
    );
  }
}
