import 'dart:async';

import 'package:get/get.dart';
import 'package:mobmart/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  SplashScreenController();

  @override
  void onInit() async {
    super.onInit();
    await loading();
  }

  Future<void> loading() async {
    Timer(const Duration(seconds: 3), () {
      Get.offAndToNamed(Routes.landing);
    });
  }
}
