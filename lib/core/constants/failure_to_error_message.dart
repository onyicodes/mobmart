import 'package:mobmart/core/constants/error_texts.dart';
import 'package:mobmart/core/error/failures.dart';

String mapFailureToErrorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case NetworkFailure:
      final response = ErrorMessage.networkError;
      return response;
    case ServerFailure:
      final response = ErrorMessage.serverError;
      return response;
    case UnknownFailure:
      final response = ErrorMessage.unknownError;
      return response;
    case NotFoundFailure:
      final response = ErrorMessage.noResultFound;
      return response;
    case BadRequestFailure:
      final response =  ErrorMessage.badRequest;
      return response;
    case ForbiddenFailure:
      final response = ErrorMessage.forbidden;
      return response;
    case AccountNotVerifiedFailure:
      final response = ErrorMessage.accountNotVerified;
      return response;
    case AccountExistsFailure:
      final response = ErrorMessage.accountAlreadyExists;
      return response;
    default:
      final response = ErrorMessage.unknownError;
      return response;
  }
}
