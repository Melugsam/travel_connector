import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/domain/entity/city_entity.dart';
import 'package:travel_connector/features/search/domain/repository/city_repository.dart';

class CityUseCase {
  final CityRepository _cityRepository;

  CityUseCase(this._cityRepository);

  Future<Either<DomainException, List<CityEntity>>> call(
      String keyword,
      ) async {
    return _cityRepository.fetchCity(keyword);
  }
}