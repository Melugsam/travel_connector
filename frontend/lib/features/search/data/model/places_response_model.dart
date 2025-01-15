import 'package:json_annotation/json_annotation.dart';

part 'places_response_model.g.dart';

@JsonSerializable()
class PlacesResponseModel {
  @JsonKey(name: 'html_attributions')
  final List<String> htmlAttributions;

  @JsonKey(name: 'next_page_token')
  final String? nextPageToken;

  final List<PlaceModel> results;

  final String status;

  PlacesResponseModel({
    required this.htmlAttributions,
    this.nextPageToken,
    required this.results,
    required this.status,
  });

  factory PlacesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlacesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesResponseModelToJson(this);
}

@JsonSerializable()
class PlaceModel {
  @JsonKey(name: 'business_status')
  final String businessStatus;

  final GeometryModel geometry;

  final String icon;

  @JsonKey(name: 'icon_background_color')
  final String iconBackgroundColor;

  @JsonKey(name: 'icon_mask_base_uri')
  final String iconMaskBaseUri;

  final String name;

  @JsonKey(name: 'opening_hours')
  final OpeningHoursModel? openingHours;

  final List<PhotoModel>? photos;

  @JsonKey(name: 'place_id')
  final String placeId;

  @JsonKey(name: 'plus_code')
  final PlusCodeModel? plusCode;

  final double? rating;

  final String reference;

  final List<String> types;

  @JsonKey(name: 'user_ratings_total')
  final int? userRatingsTotal;

  final String vicinity;

  PlaceModel({
    required this.businessStatus,
    required this.geometry,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconMaskBaseUri,
    required this.name,
    this.openingHours,
    this.photos,
    required this.placeId,
    this.plusCode,
    this.rating,
    required this.reference,
    required this.types,
    this.userRatingsTotal,
    required this.vicinity,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceModelToJson(this);
}

@JsonSerializable()
class GeometryModel {
  final LocationModel location;

  final ViewportModel viewport;

  GeometryModel({
    required this.location,
    required this.viewport,
  });

  factory GeometryModel.fromJson(Map<String, dynamic> json) =>
      _$GeometryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryModelToJson(this);
}

@JsonSerializable()
class LocationModel {
  final double lat;
  final double lng;

  LocationModel({
    required this.lat,
    required this.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class ViewportModel {
  final LocationModel northeast;
  final LocationModel southwest;

  ViewportModel({
    required this.northeast,
    required this.southwest,
  });

  factory ViewportModel.fromJson(Map<String, dynamic> json) =>
      _$ViewportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewportModelToJson(this);
}

@JsonSerializable()
class OpeningHoursModel {
  @JsonKey(name: 'open_now')
  final bool openNow;

  OpeningHoursModel({required this.openNow});

  factory OpeningHoursModel.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursModelFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningHoursModelToJson(this);
}

@JsonSerializable()
class PhotoModel {
  final int height;

  @JsonKey(name: 'html_attributions')
  final List<String> htmlAttributions;

  @JsonKey(name: 'photo_reference')
  final String photoReference;

  final int width;

  PhotoModel({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}

@JsonSerializable()
class PlusCodeModel {
  @JsonKey(name: 'compound_code')
  final String compoundCode;

  @JsonKey(name: 'global_code')
  final String globalCode;

  PlusCodeModel({
    required this.compoundCode,
    required this.globalCode,
  });

  factory PlusCodeModel.fromJson(Map<String, dynamic> json) =>
      _$PlusCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlusCodeModelToJson(this);
}
