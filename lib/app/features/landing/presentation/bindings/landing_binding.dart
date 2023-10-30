import 'package:get/get.dart';
import 'package:mobmart/app/features/favourites/presentation/bindings/favourite_binding.dart';
import 'package:mobmart/app/features/home/presentation/bindings/home_binding.dart';
import 'package:mobmart/app/features/landing/presentation/controllers/landing_controller.dart';

final landingControllerSl = GetInstance();

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    landingControllerSl.lazyPut<LandingController>(() => LandingController(),
        permanent: true);

    HomeBinding().dependencies();
    FavouriteBinding().dependencies();
  }
}
