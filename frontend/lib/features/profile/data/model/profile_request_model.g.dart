// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRequestModel _$ProfileRequestModelFromJson(Map<String, dynamic> json) =>
    ProfileRequestModel(
      userId: (json['user_id'] as num).toInt(),
      targetUserId: (json['target_user_id'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileRequestModelToJson(
        ProfileRequestModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'target_user_id': instance.targetUserId,
    };
