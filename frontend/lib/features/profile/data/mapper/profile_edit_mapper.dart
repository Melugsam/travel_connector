import 'package:travel_connector/features/profile/domain/entity/profile_edit_entity.dart';

import '../model/profile_edit_response_model.dart';

class ProfileEditMapper{
  ProfileEditEntity mapToEntity(ProfileEditResponseModel model){
    return ProfileEditEntity(message: model.message);
  }
}