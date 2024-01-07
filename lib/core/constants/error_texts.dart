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
}

class LocaleKeysAuthFieldText {
  static String emailLabel = LocaleKeys.pages_auth_emailLabel.tr();
  static String emailHint = LocaleKeys.pages_auth_emailHint.tr();
  static String phoneLabel = LocaleKeys.pages_auth_phoneLabel.tr();
  static String phoneHint = LocaleKeys.pages_auth_phoneHint.tr();
  static String nameLabel = LocaleKeys.pages_auth_nameLabel.tr();
  static String nameHint = LocaleKeys.pages_auth_nameHint.tr();
  static String passwordLabel = LocaleKeys.pages_auth_passwordLabel.tr();
  static String passwordHint = LocaleKeys.pages_auth_passwordHint.tr();
  static String signinButtonLabel =
      LocaleKeys.pages_auth_signinButtonLabel.tr();
  static String signupButtonLabel =
      LocaleKeys.pages_auth_signupButtonLabel.tr();
  static String signinPageTitle = LocaleKeys.pages_auth_signInTitle.tr();
  static String signinPageSubtitle = LocaleKeys.pages_auth_signInSubtitle.tr();
  static String signupPageTitle = LocaleKeys.pages_auth_signUpTitle.tr();
  static String signupPageSubtitle = LocaleKeys.pages_auth_signUpSubtitle.tr();
  static String forgotPassword = LocaleKeys.pages_auth_forgotPasword.tr();
  static String alreadyHaveAccountText =
      LocaleKeys.pages_auth_alreadyHaveAccountText.tr();
  static String dontHaveAccountText =
      LocaleKeys.pages_auth_dontHaveAccountText.tr();
  static String forgotPasswordEnterEmailText =
      LocaleKeys.pages_auth_forgotPasswordEnterEmailText.tr();
  static String continueButton = LocaleKeys.pages_auth_continueButton.tr();
  static String continueToAppButton = LocaleKeys.pages_auth_continueToApp.tr();
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
}

enum PublishDealValidationErrorMessage {
  nameEmpty('Name field is required '),
  descriptionEmpty('Description field is required '),
  newPrice('Enter new price'),
  validFromEmpty('ValidFrom is required'),
  validToEmpty('ValidTo is required'),
  validToNotValid('Select a date ahead of valid from field'),
  categoryEmpty('Category field is required');

  const PublishDealValidationErrorMessage(this.message);
  final String message;
}

enum DealDetailsErrorMessage {
  messageEmpty('Review field cannot be empty'),
  rating('You must provide rating to proceed');

  const DealDetailsErrorMessage(this.message);
  final String message;
}

enum BusinessInfoErrorMessage {
  locationEmpty('Location field is required'),
  businessNameEmpty('Business name field is required '),
  businessDescriptionEmpty('Business description field is required '),
  businessPhoneEmpty('Business phone field is required '),
  businessTypeEmpty('Business Type field is required');

  const BusinessInfoErrorMessage(this.message);
  final String message;
}
