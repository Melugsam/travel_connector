import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_entity.freezed.dart';

@freezed
class CityEntity with _$CityEntity {
  const factory CityEntity({
    required String name,
    required String country,
    required double latitude,
    required double longitude,
    required String? region,
  }) = _CityEntity;
}
