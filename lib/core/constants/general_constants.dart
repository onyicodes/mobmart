import 'package:easy_localization/easy_localization.dart';
import 'package:mobmart_app/generated/locale_keys.g.dart';

enum ListSpacingValue {
  spacingV100(100),
  spacingV80(80),
  spacingV54(54),
  spacingV48(48),
  spacingV32(32),
  spacingV24(24),
  spacingV16(16),
  spacingV12(12),
  spacingV8(8);

  const ListSpacingValue(this.value);
  final double value;
}

class LocaleKeysSettingsTexts {
  static String logoutSuccess = LocaleKeys.pages_settings_logoutSuccess.tr();
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
      LocaleKeys.pages_auth_buttons_signinLabel.tr();
  static String signupButtonLabel =
      LocaleKeys.pages_auth_buttons_signupLabel.tr();
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
  static String continueButton = LocaleKeys.buttons_continue.tr();
  static String continueToAppButton = LocaleKeys.pages_auth_continueToApp.tr();
  static String verifyNowButton = LocaleKeys.pages_auth_buttons_verifyNow.tr();
  static String verifyAccountTitle =
      LocaleKeys.pages_auth_verifyAccountTitle.tr();
  static String verifyAccountBody =
      LocaleKeys.pages_auth_verifyAccountBody.tr();
  static String didnotReceiveCode =
      LocaleKeys.pages_auth_didnotReceiveCode.tr();
  static String codeToBeResentAfter =
      LocaleKeys.pages_auth_codeToBeResentAfter.tr();
  static String nextCodeToResentAfter =
      LocaleKeys.pages_auth_nextCodeToBeAfter.tr();
  static String resendButton = LocaleKeys.pages_auth_buttons_RESEND.tr();
  static String resetPasswordTitle = LocaleKeys.pages_auth_resetPasswordTitle.tr();
  static String resetPasswordBody = LocaleKeys.pages_auth_resetPasswordBody.tr();
  static String newPasswordHint = LocaleKeys.pages_auth_newPasswordHint.tr();
  static String conformNewPasswordHint = LocaleKeys.pages_auth_confirmNewPasswordHint.tr();
}

class LocaleKeysGeneralButtonText {
  static String cancelButton = LocaleKeys.buttons_cancel.tr();
  static String continueButton = LocaleKeys.buttons_continue.tr();
  static String reloadButton = LocaleKeys.buttons_reload.tr();
}

class LocaleKeysSnackbarText {
  static String resetSuccess = LocaleKeys.snackBar_recoverAccount_passwordResetSuccess;
  
}

enum FirestoreCollections { banners }

enum EnumAccountProviders { google, credentials, apple, facebook }

enum RequestStatus { initial, loading, success, error }
