import 'package:json_annotation/json_annotation.dart';

part 'hotel_response_model.g.dart';

@JsonSerializable()
class HotelResponseModel {
  final HotelDataResponseModel data;

  HotelResponseModel({
    required this.data,
  });

  factory HotelResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HotelResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelResponseModelToJson(this);
}

@JsonSerializable()
class HotelDataResponseModel {
  final List<HotelItemModel> data;

  HotelDataResponseModel({
    required this.data,
  });

  factory HotelDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HotelDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelDataResponseModelToJson(this);
}

@JsonSerializable()
class HotelItemModel {
  final String? id;
  final String? title;
  final String? primaryInfo;
  final String? secondaryInfo;
  final BubbleRatingModel? bubbleRating;
  final List<HotelPhotoSizesModel>? cardPhotos;

  HotelItemModel({
    required this.id,
    required this.title,
    required this.primaryInfo,
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
  final String? count;
  final double? rating;

  BubbleRatingModel({
    required this.count,
    required this.rating,
  });

  factory BubbleRatingModel.fromJson(Map<String, dynamic> json) =>
      _$BubbleRatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BubbleRatingModelToJson(this);
}

@JsonSerializable()
class HotelPhotoSizesModel {
  final HotelPhotoModel? sizes;

  HotelPhotoSizesModel({
    required this.sizes,
  });

  factory HotelPhotoSizesModel.fromJson(Map<String, dynamic> json) =>
      _$HotelPhotoSizesModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelPhotoSizesModelToJson(this);
}

@JsonSerializable()
class HotelPhotoModel {
  final String? urlTemplate;

  HotelPhotoModel({
    required this.urlTemplate,
  });

  factory HotelPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$HotelPhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelPhotoModelToJson(this);
}
