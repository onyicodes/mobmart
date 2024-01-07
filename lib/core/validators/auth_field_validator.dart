import 'package:email_validator/email_validator.dart';
import 'package:mobmart_app/app/features/auth/presentation/bindings/signup_binding.dart';
import 'package:mobmart_app/app/features/auth/presentation/controllers/signin_controller.dart';
import 'package:mobmart_app/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:mobmart_app/core/constants/error_texts.dart';
import 'package:mobmart_app/core/parameters/auth/email_signup_params.dart';
import 'package:mobmart_app/core/parameters/auth/signin_params.dart';

final signupController = getSignupControllerSl<SignupController>();
final signinController = getSignupControllerSl<SigninController>();

class AuthFieldValidationPage {
  Future<bool> validateEmailSignupData({required SignupParams params}) {
    bool validated = true;
    if (params.name.isEmpty) {
      signupController.userNameError =
          AuthFieldValidationErrorMessage.userNameEmpty;
      validated = false;
    }

    if (params.email.isEmpty) {
      signupController.emailError = AuthFieldValidationErrorMessage.emailEmpty;
      validated = false;
    }

    if (!EmailValidator.validate(params.email)) {
      signupController.emailError =
          AuthFieldValidationErrorMessage.emailFormatWrong;
      validated = false;
    }
    if (params.password.isEmpty) {
      signupController.passwordError =
          AuthFieldValidationErrorMessage.passwordEmpty;
      validated = false;
    }

    if (params.phone.isEmpty) {
      signupController.phoneError = AuthFieldValidationErrorMessage.phoneEmpty;
      validated = false;
    }

    if (signupController.phoneError.isNotEmpty) {
      validated = false;
    }

    return Future.value(validated);
  }

  Future<bool> validateEmailSigninData({required SigninParams params}) {
    bool validated = true;
    if (params.email.isEmpty) {
      signinController.emailError = AuthFieldValidationErrorMessage.fieldEmpty;
      validated = false;
    }

    if (!EmailValidator.validate(params.email)) {
      signinController.emailError =
          AuthFieldValidationErrorMessage.emailFormatWrong;
      validated = false;
    }

    if (params.password.isEmpty) {
      signinController.passwordError =
          AuthFieldValidationErrorMessage.passwordEmpty;
      validated = false;
    }

    return Future.value(validated);
  }
}
