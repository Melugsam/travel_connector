import 'package:travel_connector/features/search/data/model/hotel_response_model.dart';
import 'package:travel_connector/features/search/domain/entity/hotel_entity.dart';

class HotelMapper {
  List<HotelEntity> mapToEntity(HotelResponseModel model) {
    return model.data.data.where(_isValidHotel).map(_mapToHotelEntity).toList();
  }

  bool _isValidHotel(HotelItemModel hotel) {
    return hotel.id != null &&
        hotel.title != null &&
        hotel.bubbleRating != null &&
        hotel.cardPhotos != null &&
        hotel.cardPhotos!.isNotEmpty &&
        hotel.cardPhotos!.any(
          (photo) => photo.sizes != null,
        );
  }

  HotelEntity _mapToHotelEntity(HotelItemModel hotel) {
    return HotelEntity(
      id: hotel.id!,
      title: hotel.title!,
      primaryInfo: hotel.primaryInfo,
      secondaryInfo: hotel.secondaryInfo,
      bubbleRating: BubbleRatingEntity(
        count: hotel.bubbleRating?.count ?? '0',
        rating: hotel.bubbleRating?.rating ?? 0.0,
      ),
      photos: hotel.cardPhotos!
          .where((photo) => photo.sizes?.urlTemplate != null)
          .map(
            (photo) => photo.sizes!.urlTemplate!
                .replaceAll("{width}", "500")
                .replaceAll("{height}", "300"),
          )
          .toList(),
    );
  }
}
