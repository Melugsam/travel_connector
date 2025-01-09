import 'package:dio/dio.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/model/server_error_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_api_service.dart';

class PostRemoteDataSource {
  final PostApiService _postApiService;

  PostRemoteDataSource(this._postApiService);

  Future<List<PostResponseModel>> fetchPosts (
      int userId, int? offset, int? limit) async {
    try {
      final response = await _postApiService.fetchPosts(
        PostRequestModel(userId: userId, offset: offset, limit: limit),
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
