import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/domain/entity/places_entity.dart';
import 'package:travel_connector/features/search/domain/repository/places_repository.dart';

class PlacesUseCase {
  final PlacesRepository _placesRepository;

  PlacesUseCase(this._placesRepository);

  Future<Either<DomainException, PlacesEntity>> call(
      double latitude,
      double longitude,
      String keyword,
      ) async {
    return await _placesRepository.fetchPlaces(
      latitude,
      longitude,
      keyword,
    );
  }
}
