import 'dart:async';

import 'package:mobmart/app/features/auth/data/model/signin_model.dart';
import 'package:mobmart/app/features/auth/domain/usecases/email_signin_usecase.dart';
import 'package:mobmart/app/routes/app_pages.dart';
import 'package:mobmart/core/constants/failure_to_error_message.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/custom_snackbar.dart';
import 'package:mobmart/core/keys/cache_keys.dart';
import 'package:mobmart/core/parameters/auth/signin_params.dart';
import 'package:mobmart/core/validators/auth_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobmart/core/general_widgets/verify_pin_bottomsheet.dart';

class SigninController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FlutterSecureStorage secureStorage;

  final EmailSigninUsecase emailSigninUsecase;
  final AuthFieldValidationPage authFieldValidationPage;
  final GetStorage storeBox;
  SigninController(
      {required this.emailSigninUsecase,
      required this.authFieldValidationPage,
      required this.secureStorage,
      required this.storeBox});

  final _obscurePasswordText = true.obs;
  final _requestStatus = RequestStatus.initial.obs;
  final _phoneError = ''.obs;
  final _userNameError = ''.obs;
  final _passwordError = ''.obs;
  final _emailError = ''.obs;
  final _startedTypingPw = false.obs;

  bool get obscurePasswordText => _obscurePasswordText.value;
  String get phoneError => _phoneError.value;
  String get userNameError => _userNameError.value;
  String get passwordError => _passwordError.value;
  String get emailError => _emailError.value;
  RequestStatus get requestStatus => _requestStatus.value;
  bool get startedTypingPw => _startedTypingPw.value;

  set obscurePasswordText(value) => _obscurePasswordText.value = value;
  set phoneError(value) => _phoneError.value = value;
  set userNameError(value) => _userNameError.value = value;
  set passwordError(value) => _passwordError.value = value;
  set emailError(value) => _emailError.value = value;
  set requestStatus(value) => _requestStatus.value = value;
  set startedTypingPw(value) => _startedTypingPw.value = value;


  late String lastUserId;
  @override
  onInit(){
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

  forgotPassword({required Widget bottomsheet}) {
    Get.bottomSheet(bottomsheet);
  }

  goToPushToken() {
    if (Get.isBottomSheetOpen ?? false) {
      Get.back();
    }
    Get.bottomSheet(
        VerifyPinBottomSheet(
          onResendPin: () {},
          confirmPin: (pin) {},
          isLoading: false,
          title: '',
          subTitle: '',
        ),
        isDismissible: false);
  }

  goToPResetPassword({required Widget resetPwBottomsheet}) {
    Get.back();
    Get.bottomSheet(resetPwBottomsheet);
  }

  verifyPin({required String pin}) {}

  Future<RequestStatus> signInUser({required SigninParams params}) async {
    final failOrSignup = await emailSigninUsecase(params);
    return failOrSignup.fold((fail) async {
     // if (fail.runtimeType == AccountNotVerifiedException) {
        // final token = await Get.toNamed(Routes.verifycode,
        //     arguments: CodeVerificationData(
        //         method: CodeVerificationMeans.email,
        //         user: params.email,
        //         pushVerificationCode: true,
        //         type: VerificationRequestType.verifyAccount));

        // if (token != null) {
        //   requestStatus = RequestStatus.loading;
        //   return await signInUser(params: params);
        // } else {
        //   return Future.value(RequestStatus.error);
        // }
     // } else {
        customSnackbar(
            title: "Error",
            message: fail.message.isNotEmpty
                ? fail.message
                : mapFailureToErrorMessage(fail),
            duration: 5);
        return Future.value(RequestStatus.error);
     // }
    }, (signInModel) async {
      lastUserId = signInModel.user.id.toString();
      await storeBox.write(
          CacheKeys.loginMethod(lastUserId), EnumAccountProviders.credentials.name );
      await secureStorage.write(
          key: CacheKeys.password(lastUserId), value: params.password);

      await saveData(signInModel: signInModel, email: params.email);

      
      return Future.value(RequestStatus.success);
    });
  }

  saveData({required SigninModel signInModel, required String email}) async {
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
        CacheKeys.userData(lastUserId), signInModel.user.toMap());
    await storeBox.write(CacheKeys.isLoggedIn(lastUserId), true);
    await storeBox.write(
        CacheKeys.accountType(lastUserId), signInModel.user.userType);
  }

  // Future<RequestStatus> signInUser({required SigninParams params}) async {
  //   final failOrSignup = await emailSigninUsecase(params);
  //   failOrSignup.fold((fail) {
  //     print(fail.message);
  //     customSnackbar(title: "Error", message: mapFailureToErrorMessage(fail));
  //     return Future.value(RequestStatus.error);
  //   }, (signInModel) async {
  //     customSnackbar(title: "Success", message: "Signed in successfully");
  //     await storeBox.write(CacheKeys.accessToken, signInModel.accessToken);
  //     await storeBox.write(CacheKeys.userData, signInModel.user);
  //     await storeBox.write(CacheKeys.isLoggedIn, true);
  //     return Future.value(RequestStatus.success);
  //   });
  //   return Future.value(RequestStatus.error);
  // }

  Future<void> signin({required SigninParams params}) async {
    requestStatus = RequestStatus.loading;
    await Future.delayed(const Duration(milliseconds: 500));
    await authFieldValidationPage
        .validateEmailSigninData(params: params)
        .then((validated) async {
      if (validated) {
        requestStatus = await signInUser(params: params);

        if (requestStatus == RequestStatus.success) {
          Get.offAndToNamed(Routes.home);
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