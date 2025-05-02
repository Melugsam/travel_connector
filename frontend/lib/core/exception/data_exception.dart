import 'package:travel_connector/core/network/server_error_model.dart';

abstract class DataException implements Exception {
  final String message;
  final int? statusCode;

  DataException(this.message, {this.statusCode});
}

class NetworkException extends DataException {
  NetworkException() : super("Ошибка сети");
}

class ServerException extends DataException {
  final ServerErrorModel serverError;

  ServerException({required this.serverError, int? statusCode})
      : super(serverError.details, statusCode: statusCode);
}

class GenericDataSourceException extends DataException {
  GenericDataSourceException() : super("Произошла неизвестная ошибка");
}
