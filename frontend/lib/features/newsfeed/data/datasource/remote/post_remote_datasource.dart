import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_api_service.dart';

class PostRemoteDataSource extends BaseRemoteDataSource {
  final PostApiService _postApiService;

  PostRemoteDataSource(LoggingService loggingService, this._postApiService)
      : super(loggingService: loggingService);

  Future<Either<DataException, List<PostResponseModel>>> fetchPosts(
      int? offset, int? limit) async {
    return safeApiCall(
      () => _postApiService.fetchPosts(
        PostRequestModel(offset: offset, limit: limit),
      ),
    );
  }
}
