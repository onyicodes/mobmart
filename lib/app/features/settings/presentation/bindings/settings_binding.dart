import 'package:get/get.dart';
import 'package:mobmart_app/app/features/settings/presentation/controllers/settings_controller.dart';

final onboardingControllerSl = GetInstance();

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
        () => SettingsController(storeBox: onboardingControllerSl()));
  }
}
