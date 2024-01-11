import 'package:mobmart_app/core/constants/error_texts.dart';
import 'package:mobmart_app/core/error/failures.dart';

String mapFailureToErrorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case const (NetworkFailure):
      final response = ErrorMessage.networkError;
      return response;
    case const (ServerFailure):
      final response = ErrorMessage.serverError;
      return response;
    case const (TokenNotFoundFailure):
      final response = ErrorMessage.invalidTokenError;
      return response;
    case const (UnknownFailure):
      final response = ErrorMessage.unknownError;
      return response;
    case const (NotFoundFailure):
      final response = ErrorMessage.noResultFound;
      return response;
    case const (BadRequestFailure):
      final response = ErrorMessage.badRequest;
      return response;
    case const (ForbiddenFailure):
      final response = ErrorMessage.forbidden;
      return response;
    case const (FailedLoginFailure):
      final response = ErrorMessage.failedLogin;
      return response;
    case const (AccountNotFoundFailure):
      final response = ErrorMessage.accountNotFound;
      return response;
    case const (AccountNotVerifiedFailure):
      final response = ErrorMessage.accountNotVerified;
      return response;
    case const (AccountExistsFailure):
      final response = ErrorMessage.accountAlreadyExists;
      return response;
    default:
      final response = ErrorMessage.unknownError;
      return response;
  }
}
