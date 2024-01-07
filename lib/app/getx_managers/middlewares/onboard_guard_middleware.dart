import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobmart_app/app/getx_managers/services/auth_services.dart';
import 'package:mobmart_app/app/routes/app_pages.dart';

class OnboardGuardMiddleware extends GetMiddleware {
  var authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.hasOnboarded()
        ? const RouteSettings(name: Routes.signup)
        : null;
  }
}
