import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_write_comment_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_write_comment_response_model.dart';

part 'post_write_comment_api_service.g.dart';

@RestApi()
abstract class PostWriteCommentApiService {
  factory PostWriteCommentApiService(Dio dio, {String baseUrl}) = _PostWriteCommentApiService;

  @POST('/posts/addComment')
  Future<PostWriteCommentResponseModel> executeComment(@Body() PostWriteCommentRequestModel request);
}