import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mobmart/app/features/splash/presentation/controllers/splash_screen_controller.dart';
import 'package:mobmart/core/network/network_info.dart';


final getSplashscreenControllerSl = GetInstance();

class SplashBinding implements Bindings {
  @override
  void dependencies() async {
    getSplashscreenControllerSl.lazyPut<SplashScreenController>(
        () => SplashScreenController());

    getSplashscreenControllerSl.lazyPut(
        () =>FirebaseFirestore.instance);

    Get.put<NetworkInfo>(NetworkInfoImpl(InternetConnection()), permanent: true);

  }
}
