import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';

part 'profile_edit_entity.freezed.dart';

@freezed
class ProfileEditEntity with _$ProfileEditEntity {
  const factory ProfileEditEntity({
    required String message
  }) = _ProfileEditEntity;
}