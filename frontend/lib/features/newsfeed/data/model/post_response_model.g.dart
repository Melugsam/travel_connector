// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponseModel _$PostResponseModelFromJson(Map<String, dynamic> json) =>
    PostResponseModel(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      title: json['title'] as String?,
      createdAt: json['created_at'] as String,
      likesCount: (json['likes_count'] as num).toInt(),
      commentsCount: (json['comments_count'] as num).toInt(),
      likedBy: (json['liked_by'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      liked: json['liked'] as bool,
      user: UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>)
          .map((e) => PostImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      route: json['route'] == null
          ? null
          : MapRouteModel.fromJson(json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostResponseModelToJson(PostResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'title': instance.title,
      'created_at': instance.createdAt,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'liked_by': instance.likedBy,
      'liked': instance.liked,
      'user': instance.user.toJson(),
      'images': instance.images.map((e) => e.toJson()).toList(),
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'route': instance.route?.toJson(),
    };

PostImageModel _$PostImageModelFromJson(Map<String, dynamic> json) =>
    PostImageModel(
      url: json['url'] as String,
    );

Map<String, dynamic> _$PostImageModelToJson(PostImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

CommentResponseModel _$CommentResponseModelFromJson(
        Map<String, dynamic> json) =>
    CommentResponseModel(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      user: UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentResponseModelToJson(
        CommentResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'created_at': instance.createdAt,
      'user': instance.user.toJson(),
    };

MapRouteModel _$MapRouteModelFromJson(Map<String, dynamic> json) =>
    MapRouteModel(
      markers: (json['markers'] as List<dynamic>)
          .map((e) => MarkerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      routes: (json['routes'] as List<dynamic>)
          .map((e) => RouteConnectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MapRouteModelToJson(MapRouteModel instance) =>
    <String, dynamic>{
      'markers': instance.markers,
      'routes': instance.routes,
    };

MarkerModel _$MarkerModelFromJson(Map<String, dynamic> json) => MarkerModel(
      point: LatLngModel.fromJson(json['point'] as Map<String, dynamic>),
      type: json['type'] as String,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$MarkerModelToJson(MarkerModel instance) =>
    <String, dynamic>{
      'point': instance.point,
      'type': instance.type,
      'label': instance.label,
    };

LatLngModel _$LatLngModelFromJson(Map<String, dynamic> json) => LatLngModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LatLngModelToJson(LatLngModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

RouteConnectionModel _$RouteConnectionModelFromJson(
        Map<String, dynamic> json) =>
    RouteConnectionModel(
      fromIndex: (json['from_index'] as num).toInt(),
      toIndex: (json['to_index'] as num).toInt(),
    );

Map<String, dynamic> _$RouteConnectionModelToJson(
        RouteConnectionModel instance) =>
    <String, dynamic>{
      'from_index': instance.fromIndex,
      'to_index': instance.toIndex,
    };
