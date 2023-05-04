

import 'package:get/get.dart';
import 'package:mobmart/app/features/home/presentation/bindings/home_binding.dart';
import 'package:mobmart/app/features/home/presentation/pages/home.dart';
import 'package:mobmart/app/features/landing/presentation/bindings/landing_binding.dart';
import 'package:mobmart/app/features/landing/presentation/pages/landing_page.dart';
import 'package:mobmart/app/features/splash/presentation/bindings/splash_screen_binding.dart';
import 'package:mobmart/app/features/splash/presentation/pages/splash_screen.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = <GetPage>[
   GetPage(
        name: Routes.initial,
        page: () =>const SplashScreenPage(),
        binding: SplashBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.landing,
        page: () => LandingPage(),
        binding: LandingBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.home,
        page: () =>const Home(),
        binding: HomeBinding(),
        transition: Transition.leftToRight),
  ];
}
