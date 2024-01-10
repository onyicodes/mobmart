import 'package:easy_localization/easy_localization.dart';
import 'package:mobmart_app/generated/locale_keys.g.dart';

class AuthFieldValidationErrorMessage {
  static String emailEmpty =
      LocaleKeys.error_AuthFieldValidationError_emailEmpty.tr();
  static String fieldEmpty =
      LocaleKeys.error_AuthFieldValidationError_fieldEmpty.tr();
  static String emailFormatWrong =
      LocaleKeys.error_AuthFieldValidationError_emailFormatWrong.tr();
  static String phoneEmpty =
      LocaleKeys.error_AuthFieldValidationError_phoneEmpty.tr();
  static String phoneFormatWrong =
      LocaleKeys.error_AuthFieldValidationError_phoneFormatWrong.tr();
  static String userNameEmpty =
      LocaleKeys.error_AuthFieldValidationError_userNameEmpty.tr();
  static String passwordEmpty =
      LocaleKeys.error_AuthFieldValidationError_passwordEmpty.tr();
  static String passwordFormatWrong =
      LocaleKeys.error_AuthFieldValidationError_passwordFormatWrong.tr();
  static String confirmPasswordMismatch =
      LocaleKeys.error_AuthFieldValidationError_confirmPasswordMismatch.tr();
}

class ErrorMessage {
  static String networkError = LocaleKeys.error_networkError.tr();
  static String serverError = LocaleKeys.error_serverError.tr();
  static String notAuthorized = LocaleKeys.error_notAuthorized.tr();
  static String badRequest = LocaleKeys.error_badRequest.tr();
  static String cachingFailed = LocaleKeys.error_cachingFailed.tr();
  static String unknownError = LocaleKeys.error_unknownError.tr();
  static String forbidden = LocaleKeys.error_forBiddenError.tr();
  static String noResultFound = LocaleKeys.error_noResultError.tr();
  static String accountAlreadyExists =
      LocaleKeys.error_createAccount_emailExists.tr();
  static String failedLogin = LocaleKeys.error_login_failedLogin.tr();
  static String accountNotFound = LocaleKeys.error_login_accountNotFound.tr();
  static String accountNotVerified =
      LocaleKeys.error_login_accountNotVerified.tr();
  static String invalidTokenError = LocaleKeys.error_login_tokenNotFound.tr();
}
