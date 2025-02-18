import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_entity.freezed.dart';

@freezed
class AccessEntity with _$AccessEntity {
  const factory AccessEntity({
    required String accessToken,
  }) = _AccessEntity;

}
