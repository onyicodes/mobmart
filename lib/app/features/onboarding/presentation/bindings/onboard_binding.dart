import 'package:mobmart/app/features/onboarding/data/datasources/onboard_content_local_data_source.dart';
import 'package:mobmart/app/features/onboarding/data/repository/onboard_content_repository.dart';
import 'package:mobmart/app/features/onboarding/domain/repositories/onboard_content_repository.dart';
import 'package:mobmart/app/features/onboarding/domain/usecases/onboard_buyer_content_usecase.dart';
import 'package:mobmart/app/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

final onboardingControllerSl = GetInstance();

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController(
        onboardingContent: onboardingControllerSl(),
        storeBox: onboardingControllerSl()));

    onboardingControllerSl.lazyPut<OnboardContentUsecase>(
        () => OnboardContentUsecase(repository: onboardingControllerSl()));

    onboardingControllerSl.lazyPut<OnboardContentRepository>(
        () => OnboardContentRepositoryImpl(api: onboardingControllerSl()));

    onboardingControllerSl.lazyPut<OnboardContentLocalDataSource>(
        () => OnboardContentLocalDataSourceImpl());
  }
}
