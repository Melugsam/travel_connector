// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelResponseModel _$HotelResponseModelFromJson(Map<String, dynamic> json) =>
    HotelResponseModel(
      data:
          HotelDataResponseModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelResponseModelToJson(HotelResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

HotelDataResponseModel _$HotelDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    HotelDataResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => HotelItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotelDataResponseModelToJson(
        HotelDataResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

HotelItemModel _$HotelItemModelFromJson(Map<String, dynamic> json) =>
    HotelItemModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      primaryInfo: json['primaryInfo'] as String?,
      secondaryInfo: json['secondaryInfo'] as String?,
      bubbleRating: json['bubbleRating'] == null
          ? null
          : BubbleRatingModel.fromJson(
              json['bubbleRating'] as Map<String, dynamic>),
      cardPhotos: (json['cardPhotos'] as List<dynamic>?)
          ?.map((e) => HotelPhotoSizesModel.fromJson(e as Map<String, dynamic>))
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
      count: json['count'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BubbleRatingModelToJson(BubbleRatingModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rating': instance.rating,
    };

HotelPhotoSizesModel _$HotelPhotoSizesModelFromJson(
        Map<String, dynamic> json) =>
    HotelPhotoSizesModel(
      sizes: json['sizes'] == null
          ? null
          : HotelPhotoModel.fromJson(json['sizes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelPhotoSizesModelToJson(
        HotelPhotoSizesModel instance) =>
    <String, dynamic>{
      'sizes': instance.sizes,
    };

HotelPhotoModel _$HotelPhotoModelFromJson(Map<String, dynamic> json) =>
    HotelPhotoModel(
      urlTemplate: json['urlTemplate'] as String?,
    );

Map<String, dynamic> _$HotelPhotoModelToJson(HotelPhotoModel instance) =>
    <String, dynamic>{
      'urlTemplate': instance.urlTemplate,
    };
