import 'package:get/get.dart';
import 'package:mobmart/app/features/signin/presentation/bindings/signin_binding.dart';
import 'package:mobmart/app/features/signup/data/datasources/signup_datasource.dart';
import 'package:mobmart/app/features/signup/data/repository/signup_repository_impl.dart';
import 'package:mobmart/app/features/signup/domain/repositories/signup_repository.dart';
import 'package:mobmart/app/features/signup/domain/usecases/email_signup_usecase.dart';
import 'package:mobmart/app/features/signup/domain/usecases/resend_verify_token_usecase.dart';
import 'package:mobmart/app/features/signup/domain/usecases/verify_account_token_usecase.dart';
import 'package:mobmart/app/features/signup/presentation/controllers/signup_controller.dart';
import 'package:mobmart/core/validators/auth_field_validator.dart';

final getSignupControllerSl = GetInstance();

class SignupBinding implements Bindings {
  @override
  void dependencies() {
     SigninBinding().dependencies();
    getSignupControllerSl.lazyPut<SignupController>(
        () => SignupController(emailSignupUsecase: getSignupControllerSl(), authFieldValidationPage: getSignupControllerSl(), storeBox: getSignupControllerSl(), secureStorage: getSignupControllerSl(), verifyAccountTokenUsecase: getSignupControllerSl(), resendVerifyTokenUsecase: getSignupControllerSl()));

    getSignupControllerSl.lazyPut<EmailSignupUsecase>(
        () => EmailSignupUsecase(repository: getSignupControllerSl()));

    getSignupControllerSl.lazyPut<VerifyAccountTokenUsecase>(
        () => VerifyAccountTokenUsecase(repository: getSignupControllerSl()));

    getSignupControllerSl.lazyPut<ResendVerifyTokenUsecase>(
        () => ResendVerifyTokenUsecase(repository: getSignupControllerSl()));
        

    getSignupControllerSl.lazyPut<AuthFieldValidationPage>(
        () => AuthFieldValidationPage());

    getSignupControllerSl.lazyPut<SignupRepository>(
        () => SignupRepositoryImpl(dataProvider: getSignupControllerSl()));

    getSignupControllerSl.lazyPut<SignupDataProvider>(() => SignupDataProviderImpl( networkInfo: getSignupControllerSl()));
  }
}
