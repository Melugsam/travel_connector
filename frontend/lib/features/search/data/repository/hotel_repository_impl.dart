import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/search/data/datasource/remote/hotel_remote_datasource.dart';
import 'package:travel_connector/features/search/data/mapper/hotel_mapper.dart';
import 'package:travel_connector/features/search/domain/entity/hotel_entity.dart';
import 'package:travel_connector/features/search/domain/repository/hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelMapper _hotelMapper;
  final HotelRemoteDataSource _hotelRemoteDataSource;
  final LoggingService _loggingService;

  HotelRepositoryImpl(
    this._hotelRemoteDataSource,
    this._hotelMapper,
    this._loggingService,
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
    } on ServerException catch (error, stackTrace) {
      _loggingService.logError("HotelRepositoryImpl", error, stackTrace);
      if (error.serverError.errorCode == 401) {
        throw UnauthorizedException();
      } else if (error.serverError.errorCode == 403) {
        throw PermissionDeniedException();
      } else {
        throw GenericDomainException(error.serverError.details);
      }
    } on NetworkException catch (error, stackTrace) {
      _loggingService.logError("HotelRepositoryImpl", error, stackTrace);
      throw GenericDomainException(
          "Ошибка сети. Проверьте подключение к интернету.");
    } catch (error, stackTrace) {
      _loggingService.logError("HotelRepositoryImpl", error, stackTrace);
      throw GenericDomainException(
          "Произошла неизвестная ошибка. Попробуйте позже.");
    }
  }
}
