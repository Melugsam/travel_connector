import 'package:travel_connector/features/search/data/model/city_response_model.dart';
import 'package:travel_connector/features/search/domain/entity/city_entity.dart';

class CityMapper {
  List<CityEntity> mapToEntity(CityResponseModel model) {
    return model.features
        .where(
          (city) =>
              city.properties.city != null &&
              city.properties.lat != null &&
              city.properties.lon != null &&
              city.properties.country != null,
        )
        .map(
          (city) => CityEntity(
            name: city.properties.city!,
            latitude: city.properties.lat!,
            longitude: city.properties.lon!,
            country: city.properties.country!,
            region: city.properties.region
          ),
        )
        .toList();
  }
}
