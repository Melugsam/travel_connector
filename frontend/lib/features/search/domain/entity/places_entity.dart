import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_entity.freezed.dart';

@freezed
class PlacesEntity with _$PlacesEntity {
  const factory PlacesEntity({
    required List<PlaceEntity> places,
  }) = _PlacesEntity;
}

@freezed
class PlaceEntity with _$PlaceEntity {
  const factory PlaceEntity({
    required String name,
    required String vicinity,
    required double? rating,
    required int? userRatingsTotal,
    required String icon,
    required bool isOpenNow,
    required double latitude,
    required double longitude,
  }) = _PlaceEntity;
}
