import 'package:travel_connector/features/search/domain/entity/hotel_entity.dart';

abstract class HotelRepository {
  Future<List<HotelEntity>> fetchHotel(
    double latitude,
    double longitude,
    String checkIn,
    String checkOut,
  );
}
