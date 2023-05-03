
import 'package:get/get.dart';
import 'package:mobmart/app/features/presentation/controllers/splash_screen_controller.dart';


final getSplashscreenControllerSl = GetInstance();

class SplashBinding implements Bindings {
  @override
  void dependencies() async {
    getSplashscreenControllerSl.lazyPut<SplashScreenController>(
        () => SplashScreenController(),);

  }
}
