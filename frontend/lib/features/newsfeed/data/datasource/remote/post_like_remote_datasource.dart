import 'package:dio/dio.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/model/server_error_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_like_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_like_response_model.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_like_api_service.dart';

class PostLikeRemoteDataSource {
  final PostLikeApiService _postLikeApiService;

  PostLikeRemoteDataSource(this._postLikeApiService);

  Future<PostLikeResponseModel> executeLike (
      int userId, int postId) async {
    try {
      final response = await _postLikeApiService.executeLike(
        PostLikeRequestModel(userId: userId, postId: postId),
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
