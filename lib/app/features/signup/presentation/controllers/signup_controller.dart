import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';
import 'package:mobmart/app/features/signup/domain/usecases/email_signup_usecase.dart';
import 'package:mobmart/app/routes/app_pages.dart';
import 'package:mobmart/core/constants/error_texts.dart';
import 'package:mobmart/core/constants/failure_to_error_message.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/custom_snackbar.dart';
import 'package:mobmart/core/keys/cache_keys.dart';
import 'package:mobmart/core/parameters/auth/email_signup_params.dart';
import 'package:mobmart/core/validators/auth_field_validator.dart';
import 'package:phone_form_field/phone_form_field.dart';

class SignupController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final phoneController =
      PhoneController(const PhoneNumber(isoCode: IsoCode.NG, nsn: ""));

  final FlutterSecureStorage secureStorage;

  final EmailSignupUsecase emailSignupUsecase;
  final AuthFieldValidationPage authFieldValidationPage;
  final GetStorage storeBox;
  SignupController(
      {required this.emailSignupUsecase,
      required this.authFieldValidationPage,
      required this.secureStorage,
      required this.storeBox});

  RegExp regexSpecialCharater = RegExp(r'^(?=.*?[!@#\$&*~])');
  RegExp regexHas8Characters = RegExp(r'.{8,}$');
  RegExp regexHasUppercase = RegExp(r'^(?=.*[A-Z])');
  RegExp regexHasLowercase = RegExp(r'^(?=.*[a-z])');
  RegExp regexHasNumber = RegExp(r'^(?=.*?[0-9])');

  final _obscurePasswordText = true.obs;
  final _requestStatus = RequestStatus.initial.obs;
  final _phoneError = ''.obs;
  final _userNameError = ''.obs;
  final _passwordError = ''.obs;
  final _emailError = ''.obs;
  final _startedTypingPw = false.obs;
  final _validPasswordField = false.obs;

  final _has8Characters = false.obs;
  final _hasUppercase = false.obs;
  final _hasLowercase = false.obs;
  final _hasNumber = false.obs;
  final _hasSpecialCharacter = false.obs;

  bool get obscurePasswordText => _obscurePasswordText.value;
  String get phoneError => _phoneError.value;
  String get userNameError => _userNameError.value;
  String get passwordError => _passwordError.value;
  String get emailError => _emailError.value;
  RequestStatus get requestStatus => _requestStatus.value;
  bool get startedTypingPw => _startedTypingPw.value;
  bool get validPasswordField => _validPasswordField.value;

  bool get has8Characters => _has8Characters.value;
  bool get hasUppercase => _hasUppercase.value;
  bool get hasLowercase => _hasLowercase.value;
  bool get hasNumber => _hasNumber.value;
  bool get hasSpecialCharacter => _hasSpecialCharacter.value;

  set obscurePasswordText(value) => _obscurePasswordText.value = value;
  set phoneError(value) => _phoneError.value = value;
  set userNameError(value) => _userNameError.value = value;
  set passwordError(value) => _passwordError.value = value;
  set emailError(value) => _emailError.value = value;
  set requestStatus(value) => _requestStatus.value = value;
  set startedTypingPw(value) => _startedTypingPw.value = value;
  set validPasswordField(value) => _validPasswordField.value = value;

  set has8Characters(value) => _has8Characters.value = value;
  set hasUppercase(value) => _hasUppercase.value = value;
  set hasLowercase(value) => _hasLowercase.value = value;
  set hasNumber(value) => _hasNumber.value = value;
  set hasSpecialCharacter(value) => _hasSpecialCharacter.value = value;

  Future<void> goToSignIn() async {
    Get.offAndToNamed(Routes.signin);
  }

  checkPassword({required String text}) {
    //clears error text when user starts typing after an error occurred in the password field
    if (passwordError.isNotEmpty) {
          passwordError = '';
      }
    //checks if user has started typing to determine when to show the password field requirements
    if (text.isEmpty) {
        startedTypingPw = false;
      }else
      if (text.isNotEmpty && !startedTypingPw) {
        startedTypingPw = true;
      }
      
    regexSpecialCharater.hasMatch(text)
        ? hasSpecialCharacter = true
        : hasSpecialCharacter = false;

    regexHas8Characters.hasMatch(text)
        ? has8Characters = true
        : has8Characters = false;

    regexHasUppercase.hasMatch(text)
        ? hasUppercase = true
        : hasUppercase = false;

    regexHasLowercase.hasMatch(text)
        ? hasLowercase = true
        : hasLowercase = false;
    regexHasNumber.hasMatch(text) ? hasNumber = true : hasNumber = false;
    if (has8Characters &&
        hasUppercase &&
        hasLowercase &&
        hasNumber &&
        hasSpecialCharacter) {
      validPasswordField = true;
    } else {
      validPasswordField = false;
    }
  }

  Future<void> signup() async {
    requestStatus = RequestStatus.loading;
    SignupParams params = SignupParams(
      phone: "",
      email: emailAddressController.text,
      userName: userNameController.text,
      password: passwordController.text,
    );
    await authFieldValidationPage
        .validateEmailSignupData(params: params)
        .then((validated) async {
      if (validated) {
        if (validPasswordField) {
          final failOrSignup = await emailSignupUsecase(params);
          failOrSignup.fold((fail) {
            customSnackbar(
                title: 'error', message: mapFailureToErrorMessage(fail));
            requestStatus = RequestStatus.error;
          }, (token) {
            requestStatus = RequestStatus.success;
            secureStorage.write(
                key: CacheKeys.username, value: userNameController.text);
            secureStorage.write(
                key: CacheKeys.password, value: passwordController.text);
           
            // Get.toNamed(Routes.verifycode, arguments: token);
          });
        } else {
          passwordError = AuthFieldValidationErrorMessage.phoneFormatWrong;
          customSnackbar(
              title: 'Error', message: 'Check password field requirements');
          requestStatus = RequestStatus.error;
        }
      } else {
        requestStatus = RequestStatus.error;
      }
    });
  }

  onPhoneChange( PhoneNumber? p){
     String? Function(PhoneNumber?) h = PhoneValidator.validMobile();

    if (h(p) != null) {
      phoneError = AuthFieldValidationErrorMessage.phoneFormatWrong;
    } else {
      phoneError = "";
    }
  }

  appleSignup() {
    Get.toNamed(Routes.signup);
  }

  facebookSignup() {
    Get.toNamed(Routes.signup);
  }

  googleSignup() {
    Get.toNamed(Routes.signup);
  }
}
