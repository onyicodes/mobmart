import 'package:mobmart/app/features/signin/data/datasources/signin_datasource.dart';
import 'package:mobmart/app/features/signin/data/repository/signin_repository_impl.dart';
import 'package:mobmart/app/features/signin/domain/repositories/signin_repository.dart';
import 'package:mobmart/app/features/signin/domain/usecases/email_signin_usecase.dart';
import 'package:mobmart/app/features/signin/presentation/controllers/signin_controller.dart';
import 'package:mobmart/core/validators/auth_field_validator.dart';
import 'package:get/get.dart';

final getSigninControllerSl = GetInstance();

class SigninBinding implements Bindings {
  @override
  void dependencies() {
    getSigninControllerSl.lazyPut<SigninController>(() => SigninController(
        emailSigninUsecase: getSigninControllerSl(),
        authFieldValidationPage: getSigninControllerSl(),
        storeBox: getSigninControllerSl(),
        secureStorage: getSigninControllerSl()));

    getSigninControllerSl.lazyPut<EmailSigninUsecase>(
        () => EmailSigninUsecase(repository: getSigninControllerSl()));

    getSigninControllerSl
        .lazyPut<AuthFieldValidationPage>(() => AuthFieldValidationPage());

    getSigninControllerSl.lazyPut<SigninRepository>(
        () => SigninRepositoryImpl(dataProvider: getSigninControllerSl()));

    getSigninControllerSl
        .lazyPut<SigninDataProvider>(() => SigninDataProviderImpl());
  }
}
