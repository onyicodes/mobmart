import 'package:get/get.dart';
import 'package:mobmart/app/features/landing/presentation/controllers/landing_controller.dart';

final landingControllerSl = GetInstance();

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    landingControllerSl.lazyPut<LandingController>(
        () => LandingController(
            ),
        permanent: true);
  }
}
