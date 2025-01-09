import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_comment_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_comment_response_model.dart';

part 'post_comment_api_service.g.dart';

@RestApi()
abstract class PostCommentApiService {
  factory PostCommentApiService(Dio dio, {String baseUrl}) = _PostCommentApiService;

  @POST('/posts/comments')
  Future<PostCommentResponseModel> fetchPostComments(@Body() PostCommentRequestModel request);
}