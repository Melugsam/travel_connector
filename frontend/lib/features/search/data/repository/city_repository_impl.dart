import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/search/data/datasource/remote/city_remote_datasource.dart';
import 'package:travel_connector/features/search/data/mapper/city_mapper.dart';
import 'package:travel_connector/features/search/domain/entity/city_entity.dart';
import 'package:travel_connector/features/search/domain/repository/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final CityMapper _cityMapper;
  final CityRemoteDataSource _cityRemoteDataSource;
  final ErrorHandler _errorHandler;

  CityRepositoryImpl(
    this._cityRemoteDataSource,
    this._cityMapper,
    this._errorHandler,
  );

  @override
  Future<Either<DomainException, List<CityEntity>>> fetchCity(
    String cityName,
  ) async {
    final result = await _cityRemoteDataSource.fetchCity(
      cityName,
    );
    return result.fold(
      (failure) => Left(
        _errorHandler.handle(failure),
      ),
      (response) => Right(
        _cityMapper.mapToEntity(response),
      ),
    );
  }
}
