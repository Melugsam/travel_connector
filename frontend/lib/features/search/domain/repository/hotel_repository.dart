import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/domain/entity/hotel_entity.dart';

abstract class HotelRepository {
  Future<Either<DomainException, List<HotelEntity>>> fetchHotel(
    double latitude,
    double longitude,
    String checkIn,
    String checkOut,
  );
}
