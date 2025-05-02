import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_connector/core/exception/data_exception.dart';

import 'server_error_model.dart';

abstract class BaseRemoteDataSource {
  const BaseRemoteDataSource();

  Future<Either<DataException, T>> safeApiCall<T>(
      Future<T> Function() apiCall,
      ) async {
    try {
      final response = await apiCall();
      return Right(response);
    } on DioException catch (error) {
      if (error.response != null) {
        try {
          return Left(
            ServerException(
              serverError: ServerErrorModel.fromJson(error.response!.data),
            ),
          );
        } catch (_) {
          return Left(NetworkException());
        }
      } else {
        return Left(NetworkException());
      }
    } catch (_) {
      return Left(GenericDataSourceException());
    }
  }
}
