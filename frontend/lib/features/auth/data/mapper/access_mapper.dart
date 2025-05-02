import 'package:travel_connector/features/auth/data/model/auth_response_model.dart';
import 'package:travel_connector/features/auth/domain/entity/access_entity.dart';

class AccessMapper{
  AccessEntity mapToEntity(AuthResponseModel model) {
    return AccessEntity(
      accessToken: model.accessToken,
    );
  }
}