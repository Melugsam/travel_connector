// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesResponseModel _$PlacesResponseModelFromJson(Map<String, dynamic> json) =>
    PlacesResponseModel(
      htmlAttributions: (json['html_attributions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      nextPageToken: json['next_page_token'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PlaceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$PlacesResponseModelToJson(
        PlacesResponseModel instance) =>
    <String, dynamic>{
      'html_attributions': instance.htmlAttributions,
      'next_page_token': instance.nextPageToken,
      'results': instance.results,
      'status': instance.status,
    };

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) => PlaceModel(
      businessStatus: json['business_status'] as String,
      geometry:
          GeometryModel.fromJson(json['geometry'] as Map<String, dynamic>),
      icon: json['icon'] as String,
      iconBackgroundColor: json['icon_background_color'] as String,
      iconMaskBaseUri: json['icon_mask_base_uri'] as String,
      name: json['name'] as String,
      openingHours: json['opening_hours'] == null
          ? null
          : OpeningHoursModel.fromJson(
              json['opening_hours'] as Map<String, dynamic>),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeId: json['place_id'] as String,
      plusCode: json['plus_code'] == null
          ? null
          : PlusCodeModel.fromJson(json['plus_code'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
      reference: json['reference'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      userRatingsTotal: (json['user_ratings_total'] as num?)?.toInt(),
      vicinity: json['vicinity'] as String,
    );

Map<String, dynamic> _$PlaceModelToJson(PlaceModel instance) =>
    <String, dynamic>{
      'business_status': instance.businessStatus,
      'geometry': instance.geometry,
      'icon': instance.icon,
      'icon_background_color': instance.iconBackgroundColor,
      'icon_mask_base_uri': instance.iconMaskBaseUri,
      'name': instance.name,
      'opening_hours': instance.openingHours,
      'photos': instance.photos,
      'place_id': instance.placeId,
      'plus_code': instance.plusCode,
      'rating': instance.rating,
      'reference': instance.reference,
      'types': instance.types,
      'user_ratings_total': instance.userRatingsTotal,
      'vicinity': instance.vicinity,
    };

GeometryModel _$GeometryModelFromJson(Map<String, dynamic> json) =>
    GeometryModel(
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      viewport:
          ViewportModel.fromJson(json['viewport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeometryModelToJson(GeometryModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'viewport': instance.viewport,
    };

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

ViewportModel _$ViewportModelFromJson(Map<String, dynamic> json) =>
    ViewportModel(
      northeast:
          LocationModel.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest:
          LocationModel.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewportModelToJson(ViewportModel instance) =>
    <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };

OpeningHoursModel _$OpeningHoursModelFromJson(Map<String, dynamic> json) =>
    OpeningHoursModel(
      openNow: json['open_now'] as bool,
    );

Map<String, dynamic> _$OpeningHoursModelToJson(OpeningHoursModel instance) =>
    <String, dynamic>{
      'open_now': instance.openNow,
    };

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      height: (json['height'] as num).toInt(),
      htmlAttributions: (json['html_attributions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      photoReference: json['photo_reference'] as String,
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'height': instance.height,
      'html_attributions': instance.htmlAttributions,
      'photo_reference': instance.photoReference,
      'width': instance.width,
    };

PlusCodeModel _$PlusCodeModelFromJson(Map<String, dynamic> json) =>
    PlusCodeModel(
      compoundCode: json['compound_code'] as String,
      globalCode: json['global_code'] as String,
    );

Map<String, dynamic> _$PlusCodeModelToJson(PlusCodeModel instance) =>
    <String, dynamic>{
      'compound_code': instance.compoundCode,
      'global_code': instance.globalCode,
    };
