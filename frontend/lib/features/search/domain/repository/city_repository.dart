import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/domain/entity/city_entity.dart';

abstract class CityRepository {
  Future<Either<DomainException, List<CityEntity>>> fetchCity(String cityName);
}
