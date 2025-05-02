import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/search/data/datasource/remote/hotel_remote_datasource.dart';
import 'package:travel_connector/features/search/data/mapper/hotel_mapper.dart';
import 'package:travel_connector/features/search/domain/entity/hotel_entity.dart';
import 'package:travel_connector/features/search/domain/repository/hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelMapper _hotelMapper;
  final HotelRemoteDataSource _hotelRemoteDataSource;
  final ErrorHandler _errorHandler;

  HotelRepositoryImpl(
    this._hotelRemoteDataSource,
    this._hotelMapper,
    this._errorHandler,
  );

  @override
  Future<Either<DomainException, List<HotelEntity>>> fetchHotel(
    double latitude,
    double longitude,
    String checkIn,
    String checkOut,
  ) async {
    final result = await _hotelRemoteDataSource.fetchHotel(
      latitude,
      longitude,
      checkIn,
      checkOut,
    );
    return result.fold(
      (failure) => Left(
        _errorHandler.handle(failure),
      ),
      (response) => Right(
        _hotelMapper.mapToEntity(response),
      ),
    );
  }
}
