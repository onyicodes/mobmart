import 'package:get/get.dart';
import 'package:mobmart_app/app/features/auth/data/datasources/signin_datasource.dart';
import 'package:mobmart_app/app/features/auth/data/datasources/signup_datasource.dart';
import 'package:mobmart_app/app/features/auth/data/repository/signin_repository_impl.dart';
import 'package:mobmart_app/app/features/auth/data/repository/signup_repository_impl.dart';
import 'package:mobmart_app/app/features/auth/domain/repositories/signin_repository.dart';
import 'package:mobmart_app/app/features/auth/domain/repositories/signup_repository.dart';
import 'package:mobmart_app/app/features/auth/domain/usecases/email_signin_usecase.dart';
import 'package:mobmart_app/app/features/auth/domain/usecases/email_signup_usecase.dart';
import 'package:mobmart_app/app/features/auth/domain/usecases/recover_account_usecase.dart';
import 'package:mobmart_app/app/features/auth/domain/usecases/resend_verify_token_usecase.dart';
import 'package:mobmart_app/app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:mobmart_app/app/features/auth/domain/usecases/verify_account_token_usecase.dart';
import 'package:mobmart_app/app/features/auth/presentation/controllers/signin_controller.dart';
import 'package:mobmart_app/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:mobmart_app/core/validators/auth_field_validator.dart';

final getAuthControllerSl = GetInstance();

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    getAuthControllerSl.lazyPut<SignupController>(
        () => SignupController(
            emailSignupUsecase: getAuthControllerSl(),
            authFieldValidationPage: getAuthControllerSl(),
            storeBox: getAuthControllerSl(),
            secureStorage: getAuthControllerSl(),
            verifyAccountTokenUsecase: getAuthControllerSl(),
            resendVerifyTokenUsecase: getAuthControllerSl()),
        permanent: true);

    getAuthControllerSl.lazyPut<SigninController>(
        () => SigninController(
            emailSigninUsecase: getAuthControllerSl(),
            resetPasswordUsecase: getAuthControllerSl(),
            authFieldValidationPage: getAuthControllerSl(),
            recoverAccountUsecase: getAuthControllerSl(),
            storeBox: getAuthControllerSl(),
            secureStorage: getAuthControllerSl()),
        permanent: true);
    getAuthControllerSl.lazyPut<EmailSigninUsecase>(
        () => EmailSigninUsecase(repository: getAuthControllerSl()));

    getAuthControllerSl.lazyPut<RecoverAccountUsecase>(
        () => RecoverAccountUsecase(repository: getAuthControllerSl()));

    getAuthControllerSl.lazyPut<ResetPasswordUsecase>(
        () => ResetPasswordUsecase(repository: getAuthControllerSl()));

    getAuthControllerSl
        .lazyPut<AuthFieldValidationPage>(() => AuthFieldValidationPage());

    getAuthControllerSl.lazyPut<EmailSignupUsecase>(
        () => EmailSignupUsecase(repository: getAuthControllerSl()));

    getAuthControllerSl.lazyPut<VerifyAccountTokenUsecase>(
        () => VerifyAccountTokenUsecase(repository: getAuthControllerSl()));

    getAuthControllerSl.lazyPut<ResendVerifyTokenUsecase>(
        () => ResendVerifyTokenUsecase(repository: getAuthControllerSl()));

    getAuthControllerSl.lazyPut<SigninRepository>(
        () => SigninRepositoryImpl(dataProvider: getAuthControllerSl()));

    getAuthControllerSl.lazyPut<SigninDataProvider>(
        () => SigninDataProviderImpl(networkInfo: getAuthControllerSl()));

    getAuthControllerSl.lazyPut<SignupRepository>(
        () => SignupRepositoryImpl(dataProvider: getAuthControllerSl()));

    getAuthControllerSl.lazyPut<SignupDataProvider>(
        () => SignupDataProviderImpl(networkInfo: getAuthControllerSl()));
  }
}
