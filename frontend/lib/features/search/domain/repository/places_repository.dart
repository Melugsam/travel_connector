import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/domain/entity/places_entity.dart';

abstract class PlacesRepository {
  Future<Either<DomainException,PlacesEntity>> fetchPlaces(double latitude, double longitude, String keyword);
}
