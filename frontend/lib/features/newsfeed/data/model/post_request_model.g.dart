// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRequestModel _$PostRequestModelFromJson(Map<String, dynamic> json) =>
    PostRequestModel(
      userId: (json['userId'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PostRequestModelToJson(PostRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'offset': instance.offset,
      'limit': instance.limit,
    };
