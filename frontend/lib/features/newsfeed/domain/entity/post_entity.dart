import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'post_entity.freezed.dart';

@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    required int id,
    required String? title,
    required String description,
    required String createdAt,
    required int likesCount,
    required bool liked,
    required int commentsCount,
    required List<int> likedBy,
    required PostUserEntity user,
    required List<String> images,
    required List<PostCommentEntity> comments,
    MapRouteEntity? route,
  }) = _PostEntity;
}

@freezed
class PostUserEntity with _$PostUserEntity {
  const factory PostUserEntity({
    required int id,
    required String name,
    String? avatar,
  }) = _PostUserEntity;
}

@freezed
class PostCommentEntity with _$PostCommentEntity {
  const factory PostCommentEntity({
    required int id,
    required String content,
    required String createdAt,
    required PostUserEntity user,
  }) = _PostCommentEntity;
}

@freezed
class MapRouteEntity with _$MapRouteEntity {
  const factory MapRouteEntity({
    required List<MarkerEntity> markers,
    required List<RouteConnectionEntity> routes,
  }) = _MapRouteEntity;
}

@freezed
class MarkerEntity with _$MarkerEntity {
  const factory MarkerEntity({
    required double latitude,
    required double longitude,
    required String type,
    String? label,
  }) = _MarkerEntity;
}

@freezed
class RouteConnectionEntity with _$RouteConnectionEntity {
  const factory RouteConnectionEntity({
    required int fromIndex,
    required int toIndex,
  }) = _RouteConnectionEntity;
}
