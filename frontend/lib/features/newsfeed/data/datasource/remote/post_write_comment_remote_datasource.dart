import 'package:dio/dio.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/server_error_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_write_comment_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_write_comment_response_model.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_write_comment_api_service.dart';

class PostWriteCommentRemoteDataSource {
  final PostWriteCommentApiService _postWriteCommentApiService;

  PostWriteCommentRemoteDataSource(this._postWriteCommentApiService);

  Future<PostWriteCommentResponseModel> executeComment(
      int userId, int postId, String content) async {
    try {
      final response = await _postWriteCommentApiService.executeComment(
        PostWriteCommentRequestModel(
          userId: userId,
          postId: postId,
          content: content,
        ),
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
