import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/service/logging_service.dart';

abstract class ErrorHandler {
  DomainException handle(DataException error);
}

class ApiErrorHandler implements ErrorHandler {
  final LoggingService _loggingService;

  ApiErrorHandler(this._loggingService);

  @override
  DomainException handle(DataException error) {
    _loggingService.logError("ApiErrorHandler", error);

    if (error is ServerException) {
      switch (error.serverError.errorCode) {
        case 401:
          return UnauthorizedException();
        case 403:
          return PermissionDeniedException();
        default:
          return GenericDomainException(error.serverError.details);
      }
    } else if (error is NetworkException) {
      return GenericDomainException("Ошибка сети. Проверьте подключение к интернету.");
    }

    return GenericDomainException("Произошла неизвестная ошибка. Попробуйте позже.");
  }
}