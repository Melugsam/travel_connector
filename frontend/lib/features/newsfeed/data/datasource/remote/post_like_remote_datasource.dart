import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_like_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_like_response_model.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_like_api_service.dart';

class PostLikeRemoteDataSource extends BaseRemoteDataSource {
  final PostLikeApiService _postLikeApiService;

  PostLikeRemoteDataSource(this._postLikeApiService)
      : super();

  Future<Either<DataException, PostLikeResponseModel>> executeLike(
      int postId) async {
    return safeApiCall(
      () => _postLikeApiService.executeLike(
        PostLikeRequestModel(postId: postId),
      ),
    );
  }
}
