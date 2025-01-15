import 'package:json_annotation/json_annotation.dart';

part 'hotel_response_model.g.dart';

@JsonSerializable()
class HotelResponseModel {
  final bool status;
  final String message;
  final int timestamp;
  final HotelDataResponseModel data;

  HotelResponseModel({
    required this.status,
    required this.message,
    required this.timestamp,
    required this.data,
  });

  factory HotelResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HotelResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelResponseModelToJson(this);
}

@JsonSerializable()
class HotelDataResponseModel {
  final String sortDisclaimer;
  final List<HotelItemModel> data;

  HotelDataResponseModel({
    required this.sortDisclaimer,
    required this.data,
  });

  factory HotelDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HotelDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelDataResponseModelToJson(this);
}

@JsonSerializable()
class HotelItemModel {
  final String id;
  final String title;
  final String? primaryInfo;
  final String secondaryInfo;
  final BubbleRatingModel bubbleRating;
  final List<HotelPhotoModel> cardPhotos;

  HotelItemModel({
    required this.id,
    required this.title,
    this.primaryInfo,
    required this.secondaryInfo,
    required this.bubbleRating,
    required this.cardPhotos,
  });

  factory HotelItemModel.fromJson(Map<String, dynamic> json) =>
      _$HotelItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelItemModelToJson(this);
}

@JsonSerializable()
class BubbleRatingModel {
  final String count;
  final double rating;

  BubbleRatingModel({
    required this.count,
    required this.rating,
  });

  factory BubbleRatingModel.fromJson(Map<String, dynamic> json) =>
      _$BubbleRatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BubbleRatingModelToJson(this);
}

@JsonSerializable()
class HotelPhotoModel {
  final String urlTemplate;

  HotelPhotoModel({
    required this.urlTemplate,
  });

  factory HotelPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$HotelPhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelPhotoModelToJson(this);
}
