import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_create_api_service.g.dart';

@RestApi()
abstract class PostCreateApiService {
  factory PostCreateApiService(Dio dio, {String baseUrl}) = _PostCreateApiService;

  @POST('/posts/create')
  @MultiPart()
  Future<void> createPost(
      @Part(name: 'description') String description,
      @Part(name: 'route') String? routeJson,
      @Part(name: 'images') List<MultipartFile> images,
      );
}
