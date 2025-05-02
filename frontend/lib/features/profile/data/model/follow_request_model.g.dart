// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowRequestModel _$FollowRequestModelFromJson(Map<String, dynamic> json) =>
    FollowRequestModel(
      targetId: (json['target_user_id'] as num).toInt(),
    );

Map<String, dynamic> _$FollowRequestModelToJson(FollowRequestModel instance) =>
    <String, dynamic>{
      'target_user_id': instance.targetId,
    };
