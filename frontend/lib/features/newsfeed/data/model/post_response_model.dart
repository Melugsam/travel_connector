import 'package:json_annotation/json_annotation.dart';

part 'post_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PostResponseModel {
  final int id;
  final String description;
  final String? title;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'likes_count')
  final int likesCount;

  @JsonKey(name: 'comments_count')
  final int commentsCount;

  @JsonKey(name: 'liked_by')
  final List<int> likedBy;

  final bool liked;
  final UserResponseModel user;
  final List<PostImageModel> images;
  final List<CommentResponseModel> comments;

  final MapRouteModel? route;

  PostResponseModel({
    required this.id,
    required this.description,
    required this.title,
    required this.createdAt,
    required this.likesCount,
    required this.commentsCount,
    required this.likedBy,
    required this.liked,
    required this.user,
    required this.images,
    required this.comments,
    this.route,
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostResponseModelToJson(this);
}

@JsonSerializable()
class PostImageModel {
  final String url;

  PostImageModel({required this.url});

  factory PostImageModel.fromJson(Map<String, dynamic> json) =>
      _$PostImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostImageModelToJson(this);
}

@JsonSerializable()
class UserResponseModel {
  final int id;
  final String name;
  final String? avatar;

  UserResponseModel({
    required this.id,
    required this.name,
    this.avatar,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CommentResponseModel {
  final int id;
  final String content;

  @JsonKey(name: 'created_at')
  final String createdAt;

  final UserResponseModel user;

  CommentResponseModel({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.user,
  });

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentResponseModelToJson(this);
}

@JsonSerializable()
class MapRouteModel {
  final List<MarkerModel> markers;
  final List<RouteConnectionModel> routes;

  MapRouteModel({required this.markers, required this.routes});

  factory MapRouteModel.fromJson(Map<String, dynamic> json) =>
      _$MapRouteModelFromJson(json);

  Map<String, dynamic> toJson() => _$MapRouteModelToJson(this);
}

@JsonSerializable()
class MarkerModel {
  final LatLngModel point;
  final String type;
  final String? label;

  MarkerModel({
    required this.point,
    required this.type,
    this.label,
  });

  factory MarkerModel.fromJson(Map<String, dynamic> json) =>
      _$MarkerModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarkerModelToJson(this);
}

@JsonSerializable()
class LatLngModel {
  final double latitude;
  final double longitude;

  LatLngModel({required this.latitude, required this.longitude});

  factory LatLngModel.fromJson(Map<String, dynamic> json) =>
      _$LatLngModelFromJson(json);

  Map<String, dynamic> toJson() => _$LatLngModelToJson(this);
}

@JsonSerializable()
class RouteConnectionModel {
  @JsonKey(name: 'from_index')
  final int fromIndex;

  @JsonKey(name: 'to_index')
  final int toIndex;

  RouteConnectionModel({
    required this.fromIndex,
    required this.toIndex,
  });

  factory RouteConnectionModel.fromJson(Map<String, dynamic> json) =>
      _$RouteConnectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RouteConnectionModelToJson(this);
}
