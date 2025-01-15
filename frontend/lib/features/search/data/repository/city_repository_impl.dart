
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/data/datasource/remote/city_remote_datasource.dart';
import 'package:travel_connector/features/search/data/mapper/city_mapper.dart';
import 'package:travel_connector/features/search/domain/entity/city_entity.dart';
import 'package:travel_connector/features/search/domain/repository/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final CityMapper _cityMapper;
  final CityRemoteDataSource _cityRemoteDataSource;

  CityRepositoryImpl(
      this._cityRemoteDataSource,
      this._cityMapper,
      );

  @override
  Future<List<CityEntity>> fetchCity(
      String input,
      ) async {
    try {
      final response = await _cityRemoteDataSource.fetchCity(
        input,
      );
      return _cityMapper.mapToEntity(response);
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
