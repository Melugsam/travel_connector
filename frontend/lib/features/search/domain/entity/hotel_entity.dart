import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_entity.freezed.dart';

@freezed
class HotelEntity with _$HotelEntity {
  const factory HotelEntity({
    required String id,
    required String title,
    required String? primaryInfo,
    required String? secondaryInfo,
    required BubbleRatingEntity bubbleRating,
    required List<String> photos,
  }) = _HotelEntity;
}

@freezed
class BubbleRatingEntity with _$BubbleRatingEntity {
  const factory BubbleRatingEntity({
    required String count,
    required double rating,
  }) = _BubbleRatingEntity;
}
