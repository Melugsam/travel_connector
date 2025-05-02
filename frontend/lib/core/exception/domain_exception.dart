abstract class DomainException implements Exception {
  final String message;

  DomainException(this.message);
}

class UnauthorizedException extends DomainException {
  UnauthorizedException() : super("Пользователь не авторизован.");
}

class ValidationException extends DomainException {
  ValidationException(String message) : super("Ошибка валидации: $message");
}

class PermissionDeniedException extends DomainException {
  PermissionDeniedException() : super("У вас недостаточно прав для выполнения действия.");
}

class BusinessLogicException extends DomainException {
  BusinessLogicException(super.message);
}

class GenericDomainException extends DomainException {
  GenericDomainException(super.message);
}

