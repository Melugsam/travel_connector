import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_like_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_like_response_model.dart';

part 'post_like_api_service.g.dart';

@RestApi()
abstract class PostLikeApiService {
  factory PostLikeApiService(Dio dio, {String baseUrl}) = _PostLikeApiService;

  @POST('/posts/like')
  Future<PostLikeResponseModel> executeLike(@Body() PostLikeRequestModel request);
}