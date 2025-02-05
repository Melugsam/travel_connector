import 'package:travel_connector/features/search/data/model/hotel_response_model.dart';
import 'package:travel_connector/features/search/domain/entity/hotel_entity.dart';

class HotelMapper {
  List<HotelEntity> mapToEntity(HotelResponseModel model) {
    return model.data.data
        .map(
          (hotel) => HotelEntity(
            id: hotel.id,
            title: hotel.title,
            primaryInfo: hotel.primaryInfo,
            secondaryInfo: hotel.secondaryInfo,
            bubbleRating: BubbleRatingEntity(
              count: hotel.bubbleRating.count,
              rating: hotel.bubbleRating.rating,
            ),
            photos: hotel.cardPhotos
                .map(
                  (photo) => photo.urlTemplate,
                )
                .toList(),
          ),
        )
        .toList();
  }
}
