import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/profile/data/model/follow_request_model.dart';

part 'follow_api_service.g.dart';

@RestApi()
abstract class FollowApiService {
  factory FollowApiService(Dio dio, {String baseUrl}) = _FollowApiService;

  @POST('/profile/follow')
  Future<void> follow(@Body() FollowRequestModel request);
}