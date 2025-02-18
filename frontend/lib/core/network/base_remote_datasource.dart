import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/service/logging_service.dart';

import 'server_error_model.dart';

abstract class BaseRemoteDataSource {
  final LoggingService _loggingService;

  BaseRemoteDataSource({required LoggingService loggingService})
      : _loggingService = loggingService;

  Future<Either<DataException, T>> safeApiCall<T>(
    Future<T> Function() apiCall,
  ) async {
    try {
      final response = await apiCall();
      return Right(response);
    } on DioException catch (error) {
      _loggingService.logError("BaseRemoteDataSource", error);
      if (error.response != null) {
        try {
          return Left(
            ServerException(
              serverError: ServerErrorModel.fromJson(error.response!.data),
            ),
          );
        } catch (e) {
          return Left(NetworkException());
        }
      } else {
        return Left(NetworkException());
      }
    } catch (error) {
      _loggingService.logError("BaseRemoteDataSource", error);
      return Left(GenericDataSourceException());
    }
  }
}
