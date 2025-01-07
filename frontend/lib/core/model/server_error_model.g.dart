// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerErrorModel _$ServerErrorModelFromJson(Map<String, dynamic> json) =>
    ServerErrorModel(
      errorCode: (json['errorCode'] as num?)?.toInt(),
      details: json['details'] as String,
    );

Map<String, dynamic> _$ServerErrorModelToJson(ServerErrorModel instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'details': instance.details,
    };
