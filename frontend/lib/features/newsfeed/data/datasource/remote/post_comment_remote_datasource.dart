import 'package:dio/dio.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/model/server_error_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_comment_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_comment_response_model.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_comment_api_service.dart';

class PostCommentRemoteDataSource {
  final PostCommentApiService _postCommentApiService;

  PostCommentRemoteDataSource(this._postCommentApiService);

  Future<PostCommentResponseModel> fetchPostComments (int postId) async {
    try {
      final response = await _postCommentApiService.fetchPostComments(
        PostCommentRequestModel(postId: postId),
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
