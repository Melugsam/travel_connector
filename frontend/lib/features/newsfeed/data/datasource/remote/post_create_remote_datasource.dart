import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_create_request_model.dart';

class PostCreateRemoteDataSource extends BaseRemoteDataSource {
  final Dio dio;

  PostCreateRemoteDataSource({required this.dio});

  Future<Either<DataException, void>> createPost(PostCreateRequestModel model) async {
    try {
      final formData = FormData();

      formData.fields.add(MapEntry('title', model.title));
      formData.fields.add(MapEntry('description', model.description));

      if (model.route != null) {
        formData.fields.add(MapEntry('map_route', jsonEncode(model.route!.toJson())));
      }

      for (final file in model.images) {
        formData.files.add(
          MapEntry(
            'images',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      return safeApiCall(() => dio.post('/posts/create', data: formData));
    } catch (e) {
      return Left(GenericDataSourceException());
    }
  }
}
