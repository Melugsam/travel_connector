import 'package:travel_connector/features/search/data/model/places_response_model.dart';
import 'package:travel_connector/features/search/domain/entity/places_entity.dart';

class PlacesMapper {
  PlacesEntity mapToEntity(PlacesResponseModel model) {
    return PlacesEntity(
      places: model.results.map((place) {
        return PlaceEntity(
          name: place.name,
          vicinity: place.vicinity,
          rating: place.rating,
          userRatingsTotal: place.userRatingsTotal,
          icon: place.photos?.first.photoReference,
          isOpenNow: place.openingHours?.openNow ?? false,
          latitude: place.geometry.location.lat,
          longitude: place.geometry.location.lng,
        );
      }).toList(),
    );
  }
}
