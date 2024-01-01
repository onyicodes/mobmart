import 'package:easy_localization/easy_localization.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/generated/locale_keys.g.dart';

String mapFailureToErrorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case NetworkFailure:
      final response = LocaleKeys.error_networkError.tr();
      return response;
    case ServerFailure:
      final response = LocaleKeys.error_serverError.tr();
      return response;
    case UnknownFailure:
      final response =LocaleKeys.error_unknownError.tr();
      return response;
    case NotFoundFailure:
      final response = LocaleKeys.error_noResultError.tr();
      return response;
    case BadRequestFailure:
      final response = LocaleKeys.error_badRequest.tr();
      return response;
    case ForbiddenFailure:
      final response = LocaleKeys.error_forBiddenError.tr();
      return response;
    default:
      final response = LocaleKeys.error_unknownError.tr();
      return response;
  }
}
