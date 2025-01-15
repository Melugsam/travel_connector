import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/data/datasource/remote/hotel_remote_datasource.dart';
import 'package:travel_connector/features/search/data/mapper/hotel_mapper.dart';
import 'package:travel_connector/features/search/domain/entity/hotel_entity.dart';
import 'package:travel_connector/features/search/domain/repository/hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelMapper _hotelMapper;
  final HotelRemoteDataSource _hotelRemoteDataSource;

  HotelRepositoryImpl(
    this._hotelRemoteDataSource,
    this._hotelMapper,
  );

  @override
  Future<List<HotelEntity>> fetchHotel(
    double latitude,
    double longitude,
    String checkIn,
    String checkOut,
  ) async {
    try {
      final response = await _hotelRemoteDataSource.fetchHotel(
         latitude,
         longitude,
         checkIn,
         checkOut,
      );
      return _hotelMapper.mapToEntity(response);
    } on ServerException catch (e) {
      if (e.serverError.errorCode == 401) {
        throw UnauthorizedException();
      } else if (e.serverError.errorCode == 403) {
        throw PermissionDeniedException();
      } else {
        throw GenericDomainException(e.serverError.details);
      }
    } on NetworkException {
      throw GenericDomainException(
          "Ошибка сети. Проверьте подключение к интернету.");
    } catch (e) {
      throw GenericDomainException(
          "Произошла неизвестная ошибка. Попробуйте позже.");
    }
  }
}
