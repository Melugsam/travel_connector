import 'package:travel_connector/features/search/domain/entity/city_entity.dart';

abstract class CityRepository {
  Future<List<CityEntity>> fetchCity(String input);
}
