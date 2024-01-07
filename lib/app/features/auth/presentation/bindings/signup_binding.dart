import 'package:get/get.dart';
import 'package:mobmart/app/features/auth/data/datasources/signin_datasource.dart';
import 'package:mobmart/app/features/auth/data/datasources/signup_datasource.dart';
import 'package:mobmart/app/features/auth/data/repository/signin_repository_impl.dart';
import 'package:mobmart/app/features/auth/data/repository/signup_repository_impl.dart';
import 'package:mobmart/app/features/auth/domain/repositories/signin_repository.dart';
import 'package:mobmart/app/features/auth/domain/repositories/signup_repository.dart';
import 'package:mobmart/app/features/auth/domain/usecases/email_signin_usecase.dart';
import 'package:mobmart/app/features/auth/domain/usecases/email_signup_usecase.dart';
import 'package:mobmart/app/features/auth/domain/usecases/resend_verify_token_usecase.dart';
import 'package:mobmart/app/features/auth/domain/usecases/verify_account_token_usecase.dart';
import 'package:mobmart/app/features/auth/presentation/controllers/signin_controller.dart';
import 'package:mobmart/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:mobmart/core/validators/auth_field_validator.dart';

final getSignupControllerSl = GetInstance();

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    getSignupControllerSl.lazyPut<SignupController>(() => SignupController(
        emailSignupUsecase: getSignupControllerSl(),
        authFieldValidationPage: getSignupControllerSl(),
        storeBox: getSignupControllerSl(),
        secureStorage: getSignupControllerSl(),
        verifyAccountTokenUsecase: getSignupControllerSl(),
        resendVerifyTokenUsecase: getSignupControllerSl()), permanent: true);

     getSignupControllerSl.lazyPut<SigninController>(
        () => SigninController(
            emailSigninUsecase: getSignupControllerSl(),
            authFieldValidationPage: getSignupControllerSl(),
            storeBox: getSignupControllerSl(),
            secureStorage: getSignupControllerSl()),
        permanent: true);
    getSignupControllerSl.lazyPut<EmailSigninUsecase>(
        () => EmailSigninUsecase(repository: getSignupControllerSl()));

    getSignupControllerSl
        .lazyPut<AuthFieldValidationPage>(() => AuthFieldValidationPage());

    getSignupControllerSl.lazyPut<SigninRepository>(
        () => SigninRepositoryImpl(dataProvider: getSignupControllerSl()));

    getSignupControllerSl.lazyPut<SigninDataProvider>(
        () => SigninDataProviderImpl(networkInfo: getSignupControllerSl()));


    getSignupControllerSl.lazyPut<EmailSignupUsecase>(
        () => EmailSignupUsecase(repository: getSignupControllerSl()));

    getSignupControllerSl.lazyPut<VerifyAccountTokenUsecase>(
        () => VerifyAccountTokenUsecase(repository: getSignupControllerSl()));

    getSignupControllerSl.lazyPut<ResendVerifyTokenUsecase>(
        () => ResendVerifyTokenUsecase(repository: getSignupControllerSl()));

    getSignupControllerSl
        .lazyPut<AuthFieldValidationPage>(() => AuthFieldValidationPage());

    getSignupControllerSl.lazyPut<SignupRepository>(
        () => SignupRepositoryImpl(dataProvider: getSignupControllerSl()));

    getSignupControllerSl.lazyPut<SignupDataProvider>(
        () => SignupDataProviderImpl(networkInfo: getSignupControllerSl()));
  }
}
