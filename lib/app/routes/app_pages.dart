

import 'package:get/get.dart';
import 'package:mobmart/app/features/presentation/bindings/splash_screen_binding.dart';
import 'package:mobmart/app/features/presentation/pages/splash_screen.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = <GetPage>[
   GetPage(
        name: Routes.initial,
        page: () =>const SplashScreenPage(),
        binding: SplashBinding(),
        transition: Transition.noTransition),
  ];
}
