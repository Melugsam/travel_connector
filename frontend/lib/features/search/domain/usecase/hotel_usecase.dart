import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/domain/entity/hotel_entity.dart';
import 'package:travel_connector/features/search/domain/repository/hotel_repository.dart';

class HotelUseCase {
  final HotelRepository _hotelRepository;

  HotelUseCase(this._hotelRepository);

  Future<Either<DomainException, List<HotelEntity>>> call(
    double latitude,
    double longitude,
    String checkIn,
    String checkOut,
  ) async {
    try {
      final result = await _hotelRepository.fetchHotel(
        latitude,
        longitude,
        checkIn,
        checkOut,
      );
      return Right(result);
    } on DomainException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GenericDomainException("Неизвестная ошибка"));
    }
  }
}
