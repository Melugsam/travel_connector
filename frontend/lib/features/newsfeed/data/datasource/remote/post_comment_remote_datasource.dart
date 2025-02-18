import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_comment_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_comment_response_model.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_comment_api_service.dart';

class PostCommentRemoteDataSource extends BaseRemoteDataSource {
  final PostCommentApiService _postCommentApiService;

  PostCommentRemoteDataSource(
      LoggingService loggingService, this._postCommentApiService)
      : super(loggingService: loggingService);

  Future<Either<DataException, PostCommentResponseModel>> fetchPostComments(
      int postId) async {
    return safeApiCall(
      () => _postCommentApiService.fetchPostComments(
        PostCommentRequestModel(postId: postId),
      ),
    );
  }
}
