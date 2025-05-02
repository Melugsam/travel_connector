import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';

part 'post_api_service.g.dart';

@RestApi()
abstract class PostApiService {
  factory PostApiService(Dio dio, {String baseUrl}) = _PostApiService;

  @POST('/posts')
  Future<List<PostResponseModel>> fetchPosts(@Body() PostRequestModel request);
}