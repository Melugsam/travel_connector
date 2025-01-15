// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelResponseModel _$HotelResponseModelFromJson(Map<String, dynamic> json) =>
    HotelResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      data:
          HotelDataResponseModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelResponseModelToJson(HotelResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'timestamp': instance.timestamp,
      'data': instance.data,
    };

HotelDataResponseModel _$HotelDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    HotelDataResponseModel(
      sortDisclaimer: json['sortDisclaimer'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => HotelItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotelDataResponseModelToJson(
        HotelDataResponseModel instance) =>
    <String, dynamic>{
      'sortDisclaimer': instance.sortDisclaimer,
      'data': instance.data,
    };

HotelItemModel _$HotelItemModelFromJson(Map<String, dynamic> json) =>
    HotelItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      primaryInfo: json['primaryInfo'] as String?,
      secondaryInfo: json['secondaryInfo'] as String,
      bubbleRating: BubbleRatingModel.fromJson(
          json['bubbleRating'] as Map<String, dynamic>),
      cardPhotos: (json['cardPhotos'] as List<dynamic>)
          .map((e) => HotelPhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotelItemModelToJson(HotelItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'primaryInfo': instance.primaryInfo,
      'secondaryInfo': instance.secondaryInfo,
      'bubbleRating': instance.bubbleRating,
      'cardPhotos': instance.cardPhotos,
    };

BubbleRatingModel _$BubbleRatingModelFromJson(Map<String, dynamic> json) =>
    BubbleRatingModel(
      count: json['count'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$BubbleRatingModelToJson(BubbleRatingModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rating': instance.rating,
    };

HotelPhotoModel _$HotelPhotoModelFromJson(Map<String, dynamic> json) =>
    HotelPhotoModel(
      urlTemplate: json['urlTemplate'] as String,
    );

Map<String, dynamic> _$HotelPhotoModelToJson(HotelPhotoModel instance) =>
    <String, dynamic>{
      'urlTemplate': instance.urlTemplate,
    };
