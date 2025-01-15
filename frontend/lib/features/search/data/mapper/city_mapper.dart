import 'package:travel_connector/features/search/data/model/city_response_model.dart';
import 'package:travel_connector/features/search/domain/entity/city_entity.dart';

class CityMapper {
  List<CityEntity> mapToEntity(CityResponseModel model) {
    return model.data
        .map(
          (city) => CityEntity(
            name: city.name,
            countryCode: city.countryCode,
            stateCode: city.stateCode,
            latitude: double.parse(city.latitude),
            longitude: double.parse(city.longitude),
          ),
        )
        .toList();
  }
}
