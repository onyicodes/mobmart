import 'dart:async';

import 'package:mobmart_app/app/features/auth/data/model/signin_model.dart';
import 'package:mobmart_app/app/features/auth/domain/usecases/email_signin_usecase.dart';
import 'package:mobmart_app/app/features/auth/domain/usecases/recover_account_usecase.dart';
import 'package:mobmart_app/app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:mobmart_app/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:mobmart_app/app/features/auth/presentation/widgets/reset_password_bottomsheet.dart';
import 'package:mobmart_app/app/features/auth/presentation/widgets/snackbar_verify_account_msg.dart';
import 'package:mobmart_app/app/routes/app_pages.dart';
import 'package:mobmart_app/core/constants/failure_to_error_message.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/general_widgets/custom_snackbar.dart';
import 'package:mobmart_app/core/keys/cache_keys.dart';
import 'package:mobmart_app/core/parameters/auth/recover_account_params.dart';
import 'package:mobmart_app/core/parameters/auth/reset_password_params.dart';
import 'package:mobmart_app/core/parameters/auth/signin_params.dart';
import 'package:mobmart_app/core/parameters/auth/verify_token_params.dart';
import 'package:mobmart_app/core/util/initialize_get.dart';
import 'package:mobmart_app/core/validators/auth_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';

class SigninController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController recoverAccEmailAddressController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();

  final FlutterSecureStorage secureStorage;

  final EmailSigninUsecase emailSigninUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;
  final RecoverAccountUsecase recoverAccountUsecase;
  final AuthFieldValidationPage authFieldValidationPage;

  final GetStorage storeBox;
  SigninController(
      {required this.emailSigninUsecase,
      required this.authFieldValidationPage,
      required this.recoverAccountUsecase,
      required this.resetPasswordUsecase,
      required this.secureStorage,
      required this.storeBox});

  final _obscurePasswordText = true.obs;
  final _obscureResetPasswordText = true.obs;
  final _obscureConfirmPasswordText = true.obs;
  final _requestStatus = RequestStatus.initial.obs;
  final _recoverAccRequestStatus = RequestStatus.initial.obs;
  final _sendVerificationRequestStatus = RequestStatus.initial.obs;
  final _confirmPasswordRequestStatus = RequestStatus.initial.obs;
  final _phoneError = ''.obs;
  final _userNameError = ''.obs;
  final _passwordError = ''.obs;
  final _confirmPasswordError = ''.obs;
  final _resetPasswordError = ''.obs;
  final _emailError = ''.obs;
  final _recoverAccEmailError = ''.obs;
  final _startedTypingPw = false.obs;
  final _startedTypingResetPw = false.obs;
  final _validPasswordField = false.obs;

  final _has8Characters = false.obs;
  final _hasUppercase = false.obs;
  final _hasLowercase = false.obs;
  final _hasNumber = false.obs;
  final _hasSpecialCharacter = false.obs;

  bool get obscurePasswordText => _obscurePasswordText.value;
  bool get obscureResetPasswordText => _obscureResetPasswordText.value;
  bool get obscureConfirmPasswordText => _obscureConfirmPasswordText.value;
  String get phoneError => _phoneError.value;
  String get userNameError => _userNameError.value;
  String get passwordError => _passwordError.value;
  String get confirmPasswordError => _confirmPasswordError.value;
  String get resetPasswordError => _resetPasswordError.value;
  String get emailError => _emailError.value;
  String get recoverAccEmailError => _recoverAccEmailError.value;
  RequestStatus get requestStatus => _requestStatus.value;
  RequestStatus get recoverAccRequestStatus => _recoverAccRequestStatus.value;
  RequestStatus get sendVerificationRequestStatus =>
      _sendVerificationRequestStatus.value;
  RequestStatus get resetPasswordRequestStatus =>
      _confirmPasswordRequestStatus.value;
  bool get startedTypingPw => _startedTypingPw.value;
  bool get startedTypingResetPw => _startedTypingResetPw.value;

  bool get validPasswordField => _validPasswordField.value;

  bool get has8Characters => _has8Characters.value;
  bool get hasUppercase => _hasUppercase.value;
  bool get hasLowercase => _hasLowercase.value;
  bool get hasNumber => _hasNumber.value;
  bool get hasSpecialCharacter => _hasSpecialCharacter.value;

  set obscurePasswordText(value) => _obscurePasswordText.value = value;
  set obscureResetPasswordText(value) =>
      _obscureResetPasswordText.value = value;
  set obscureConfirmPasswordText(value) =>
      _obscureConfirmPasswordText.value = value;
  set phoneError(value) => _phoneError.value = value;
  set userNameError(value) => _userNameError.value = value;
  set passwordError(value) => _passwordError.value = value;
  set confirmPasswordError(value) => _confirmPasswordError.value = value;
  set resetPasswordError(value) => _resetPasswordError.value = value;
  set emailError(value) => _emailError.value = value;
  set recoverAccEmailError(value) => _recoverAccEmailError.value = value;
  set requestStatus(value) => _requestStatus.value = value;
  set recoverAccRequestStatus(value) => _recoverAccRequestStatus.value = value;
  set resetPasswordRequestStatus(value) =>
      _confirmPasswordRequestStatus.value = value;
  set sendVerificationRequestStatus(value) =>
      _sendVerificationRequestStatus.value = value;
  set startedTypingPw(value) => _startedTypingPw.value = value;
  set startedTypingResetPw(value) => _startedTypingResetPw.value = value;
  set validPasswordField(value) => _validPasswordField.value = value;

  set has8Characters(value) => _has8Characters.value = value;
  set hasUppercase(value) => _hasUppercase.value = value;
  set hasLowercase(value) => _hasLowercase.value = value;
  set hasNumber(value) => _hasNumber.value = value;
  set hasSpecialCharacter(value) => _hasSpecialCharacter.value = value;

  RegExp regexSpecialCharater = RegExp(r'^(?=.*?[!@#\$&*~])');
  RegExp regexHas8Characters = RegExp(r'.{8,}$');
  RegExp regexHasUppercase = RegExp(r'^(?=.*[A-Z])');
  RegExp regexHasLowercase = RegExp(r'^(?=.*[a-z])');
  RegExp regexHasNumber = RegExp(r'^(?=.*?[0-9])');

  late String lastUserId;
  @override
  onInit() {
    super.onInit();
    lastUserId = storeBox.read(CacheKeys.lastUserID) ?? "";
  }

  Future<void> goToSignup() async {
    Get.offAndToNamed(Routes.signup);
  }

  checkPasswordError() {
    if (emailError.isNotEmpty) {
      emailError = '';
    }
  }

  forgotPassword({required Widget bottomsheet}) async{
    recoverAccEmailAddressController.clear();
   await Get.bottomSheet(bottomsheet,exitBottomSheetDuration: Durations.medium3, enterBottomSheetDuration: Durations.medium4 );
  }

  checkPassword({required String text}) {
    //clears error text when user starts typing after an error occurred in the password field
    if (resetPasswordError.isNotEmpty) {
      resetPasswordError = '';
    }
    //checks if user has started typing to determine when to show the password field requirements
    if (text.isEmpty) {
      startedTypingResetPw = false;
    } else if (text.isNotEmpty && !startedTypingResetPw) {
      startedTypingResetPw = true;
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

  recoverAccount() async {
    final params = RecoverAccountParams(
        email: recoverAccEmailAddressController.text.toLowerCase());

    authFieldValidationPage
        .validateRecoverAccountData(params: params)
        .then((validated) async {
      if (validated) {
        recoverAccRequestStatus = RequestStatus.loading;
        final failOrRecovered = await recoverAccountUsecase(params);

        failOrRecovered.fold((fail) {
          recoverAccRequestStatus = RequestStatus.error;
          customSnackbar(
              title: "Error",
              message: fail.message.isNotEmpty
                  ? fail.message
                  : mapFailureToErrorMessage(fail));
        }, (recovered) async {
          recoverAccRequestStatus = RequestStatus.success;
          if (Get.isBottomSheetOpen ?? false) {
           Get.back();
          }
          openVerifyRecoverAcc();
        });
      } else {
        recoverAccRequestStatus = RequestStatus.error;
      }
    });
  }

  openVerifyRecoverAcc() {
    final signupController = Get.find<SignupController>();
    if (signupController.initialized) {
      signupController.openPinVerification(
        onConfirmPin: (pin) {
          verifyRecoverAccToken(pin: pin);
        },
      );
    }
  }

  verifyRecoverAccToken({required String pin}) async {
    final signupController = Get.find<SignupController>();
    signupController.verifyTokenRequestStatus = RequestStatus.loading;
    final params = VerifyTokenParams(token: pin);
    final failOrVerify =
        await signupController.verifyAccountTokenUsecase(params);
    failOrVerify.fold((fail) async {
      signupController.verifyTokenRequestStatus = RequestStatus.error;
      await customSnackbar(
          title: 'Error',
          message: fail.message.isNotEmpty
              ? fail.message
              : mapFailureToErrorMessage(fail));
    }, (successMessage) async {
      signupController.verifyTokenRequestStatus = RequestStatus.success;
      if (Get.isBottomSheetOpen ?? false) {
        Get.back();
      }
      customSnackbar(
          title: 'Success', message: LocaleKeysSnackbarText.pinVerified);
      goToPResetPassword(
          resetPwBottomsheet: ResetPassword(
        pin: pin,
      ));
    });
  }

  resetPassword({required String pin}) async {
    resetPasswordRequestStatus = RequestStatus.loading;
    final params = ResetPasswordParams(
        password: resetPasswordController.text,
        token: pin,
        confirmPasssword: confirmPasswordController.text);
    await authFieldValidationPage
        .validateResetPasswordData(params: params)
        .then((validated) async {
      if (validated) {
        final failOrReseted = await resetPasswordUsecase(params);
        failOrReseted.fold((fail) async {
          resetPasswordRequestStatus = RequestStatus.error;
          await customSnackbar(
              title: 'Error',
              message: fail.message.isNotEmpty
                  ? fail.message
                  : mapFailureToErrorMessage(fail));
        }, (successMessage) async {
          resetPasswordRequestStatus = RequestStatus.success;
          if (Get.isBottomSheetOpen ?? false) {
            Get.back();
          }
          customSnackbar(
              title: 'Success', message: LocaleKeysSnackbarText.resetSuccess);
        });
      } else {
        resetPasswordRequestStatus = RequestStatus.error;
      }
    });
  }

  goToPResetPassword({required Widget resetPwBottomsheet}) {
    resetPasswordController.clear();
    confirmPasswordController.clear();
    Get.bottomSheet(resetPwBottomsheet,
        isScrollControlled: true, exitBottomSheetDuration: Durations.long4);
  }

  Future<RequestStatus> signInUser({required SigninParams params}) async {
    final failOrSignup = await emailSigninUsecase(params);
    return failOrSignup.fold((fail) async {
      if (fail.runtimeType == AccountNotVerifiedFailure) {
        Get.snackbar(mapFailureToErrorMessage(fail), "",
            messageText: const SnackBarVerifyAccountMsg(),
            duration: const Duration(days: 1));

        return Future.value(RequestStatus.error);
      } else {
        customSnackbar(
            title: "Error",
            message: fail.message.isNotEmpty
                ? fail.message
                : mapFailureToErrorMessage(fail),
            duration: 5);
        return Future.value(RequestStatus.error);
      }
    }, (signInModel) async {
      lastUserId = signInModel.user.id.toString();
      await storeBox.write(CacheKeys.loginMethod(lastUserId),
          EnumAccountProviders.credentials.name);
      await secureStorage.write(
          key: CacheKeys.password(lastUserId), value: params.password);

      await saveData(signInModel: signInModel, email: params.email);

      return Future.value(RequestStatus.success);
    });
  }

  saveData({required SigninModel signInModel, required String email}) async {
    await initializeGetX(); // clear route and removes all controllers before logging in
    if (storeBox.read(CacheKeys.cannotLoginAsAGuest) == null) {
      await storeBox.write(CacheKeys.cannotLoginAsAGuest, true);
    }

    lastUserId = signInModel.user.id.toString();
    await storeBox.write(CacheKeys.lastUserID, lastUserId);
    await secureStorage.write(
        key: CacheKeys.loginEmailOrPhone(lastUserId), value: email);
    await storeBox.write(
        CacheKeys.accessToken(lastUserId), "Bearer ${signInModel.accessToken}");
    await storeBox.write(CacheKeys.refreshToken(lastUserId),
        "Bearer ${signInModel.refreshToken}");
    await storeBox.write(
        CacheKeys.userData(lastUserId), signInModel.user.toJson());
    await storeBox.write(CacheKeys.isLoggedIn(lastUserId), true);
    await storeBox.write(
        CacheKeys.accountType(lastUserId), signInModel.user.userType);
  }

  verifyAccount() async {
    final signupController = Get.find<SignupController>();
    if (signupController.initialized) {
      sendVerificationRequestStatus = RequestStatus.loading;
      signupController.emailAddressController.text =
          emailAddressController.text.toLowerCase();
      signupController.passwordController.text = passwordController.text;
      sendVerificationRequestStatus = await signupController.resendVerifyToken(
          email: emailAddressController.text.toLowerCase());

      if (sendVerificationRequestStatus == RequestStatus.success) {
        signupController.openPinVerification();
      }
    }
  }

  Future<void> signin({required SigninParams params}) async {
    requestStatus = RequestStatus.loading;
    await Future.delayed(const Duration(milliseconds: 500));
    await authFieldValidationPage
        .validateEmailSigninData(params: params)
        .then((validated) async {
      if (validated) {
        requestStatus = await signInUser(params: params);

        if (requestStatus == RequestStatus.success) {
          Get.offAndToNamed(Routes.landing);
        }
      } else {
        requestStatus = RequestStatus.error;
      }
    });
  }

  facebookSignup() {
    Get.toNamed(Routes.signup);
  }

  googleSignup() {
    Get.toNamed(Routes.signup);
  }
}
