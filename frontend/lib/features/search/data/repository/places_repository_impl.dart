import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/search/data/datasource/remote/places_remote_datasource.dart';
import 'package:travel_connector/features/search/data/mapper/places_mapper.dart';
import 'package:travel_connector/features/search/domain/entity/places_entity.dart';
import 'package:travel_connector/features/search/domain/repository/places_repository.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  final PlacesMapper _placesMapper;
  final PlacesRemoteDataSource _placesRemoteDataSource;
  final ErrorHandler _errorHandler;

  PlacesRepositoryImpl(
    this._placesRemoteDataSource,
    this._placesMapper,
    this._errorHandler,
  );

  @override
  Future<Either<DomainException, PlacesEntity>> fetchPlaces(
    double latitude,
    double longitude,
    String keyword,
  ) async {
    final result = await _placesRemoteDataSource.fetchPlaces(
      latitude,
      longitude,
      keyword,
    );
    return result.fold(
      (failure) => Left(
        _errorHandler.handle(failure),
      ),
      (response) => Right(
        _placesMapper.mapToEntity(response),
      ),
    );
  }
}
