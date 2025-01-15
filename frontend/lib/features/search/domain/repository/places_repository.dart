import 'package:travel_connector/features/search/domain/entity/places_entity.dart';

abstract class PlacesRepository {
  Future<PlacesEntity> fetchPlaces(double latitude, double longitude, String keyword);
}
