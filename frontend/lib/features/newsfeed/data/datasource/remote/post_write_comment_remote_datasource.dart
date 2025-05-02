import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_write_comment_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_write_comment_response_model.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_write_comment_api_service.dart';

class PostWriteCommentRemoteDataSource extends BaseRemoteDataSource {
  final PostWriteCommentApiService _postWriteCommentApiService;

  PostWriteCommentRemoteDataSource(this._postWriteCommentApiService)
      : super();

  Future<Either<DataException, PostWriteCommentResponseModel>> executeComment(
      int postId, String content) async {
    return safeApiCall(
      () => _postWriteCommentApiService.executeComment(
        PostWriteCommentRequestModel(
          postId: postId,
          content: content,
        ),
      ),
    );
  }
}
