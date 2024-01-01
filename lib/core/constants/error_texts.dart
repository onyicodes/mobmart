import 'package:easy_localization/easy_localization.dart';
import 'package:mobmart/generated/locale_keys.g.dart';

class AuthFieldValidationErrorMessage {
  static  String emailEmpty = LocaleKeys.error_AuthFieldValidationError_emailEmpty.tr();
  static  String fieldEmpty = LocaleKeys.error_AuthFieldValidationError_fieldEmpty.tr();
  static  String emailFormatWrong = LocaleKeys.error_AuthFieldValidationError_emailFormatWrong.tr();
  static  String phoneEmpty = LocaleKeys.error_AuthFieldValidationError_phoneEmpty.tr();
  static  String phoneFormatWrong = LocaleKeys.error_AuthFieldValidationError_phoneFormatWrong.tr();
  static  String userNameEmpty = LocaleKeys.error_AuthFieldValidationError_userNameEmpty.tr();
  static  String passwordEmpty = LocaleKeys.error_AuthFieldValidationError_passwordEmpty.tr();
  static  String passwordFormatWrong =
      LocaleKeys.error_AuthFieldValidationError_passwordFormatWrong.tr();
}

enum ErrorMessage {
  networkError('Connection error'),
  serverError('Server error occurred'),
  notAuthorized('You are not authorized to perform this action'),
  cachingFailed('Cache failure'),
  unknownError('an unknown error occurred'),
  noResultFound('Result not found'),
  accountAlreadyExists('account already exists'),
  failedLogin('You have entered an invalid username or password'),
  accountNotFound('account not found');

  const ErrorMessage(this.message);
  final String message;
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
