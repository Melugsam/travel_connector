import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_edit_entity.freezed.dart';

@freezed
class ProfileEditEntity with _$ProfileEditEntity {
  const factory ProfileEditEntity({
    required String message
  }) = _ProfileEditEntity;
}