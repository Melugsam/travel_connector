import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/profile/data/model/profile_edit_response_model.dart';

part 'profile_edit_api_service.g.dart';

@RestApi()
abstract class ProfileEditApiService {
  factory ProfileEditApiService(Dio dio, {String baseUrl}) =
      _ProfileEditApiService;

  @MultiPart()
  @POST('/profile/edit')
  Future<ProfileEditResponseModel> executeProfileEdit(
    @Part(name: 'user_id') int userId,
    @Part(name: 'name') String? name,
    @Part(name: 'profile_description') String? description,
    @Part(name: 'avatar') File? avatarFile,
  );
}
