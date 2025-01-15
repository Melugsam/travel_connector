import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/data/datasource/remote/places_remote_datasource.dart';
import 'package:travel_connector/features/search/data/mapper/places_mapper.dart';
import 'package:travel_connector/features/search/domain/entity/places_entity.dart';
import 'package:travel_connector/features/search/domain/repository/places_repository.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  final PlacesMapper _placesMapper;
  final PlacesRemoteDataSource _placesRemoteDataSource;

  PlacesRepositoryImpl(
      this._placesRemoteDataSource,
      this._placesMapper,
      );

  @override
  Future<PlacesEntity> fetchPlaces(
      double latitude,
      double longitude,
      String keyword,
      ) async {
    try {
      final response = await _placesRemoteDataSource.fetchPlaces(
        latitude,
        longitude,
        keyword,
      );
      return _placesMapper.mapToEntity(response);
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
