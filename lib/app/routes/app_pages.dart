import 'package:get/get.dart';
import 'package:mobmart_app/app/features/home/presentation/bindings/home_binding.dart';
import 'package:mobmart_app/app/features/home/presentation/pages/home.dart';
import 'package:mobmart_app/app/features/landing/presentation/bindings/landing_binding.dart';
import 'package:mobmart_app/app/features/landing/presentation/pages/landing_page.dart';
import 'package:mobmart_app/app/features/onboarding/presentation/bindings/onboard_binding.dart';
import 'package:mobmart_app/app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:mobmart_app/app/features/product_details/presentation/bindings/product_details_binding.dart';
import 'package:mobmart_app/app/features/product_details/presentation/pages/product_details_page.dart';
import 'package:mobmart_app/app/features/auth/presentation/bindings/auth_binding.dart';
import 'package:mobmart_app/app/features/auth/presentation/pages/signin_page.dart';
import 'package:mobmart_app/app/features/auth/presentation/pages/signup_page.dart';
import 'package:mobmart_app/app/features/auth/presentation/pages/success_page.dart';
import 'package:mobmart_app/app/features/settings/presentation/bindings/settings_binding.dart';
import 'package:mobmart_app/app/features/settings/presentation/pages/settings_page.dart';
import 'package:mobmart_app/app/features/splash/presentation/bindings/splash_screen_binding.dart';
import 'package:mobmart_app/app/features/splash/presentation/pages/splash_screen.dart';
import 'package:mobmart_app/app/getx_managers/middlewares/auth_guard_middlewares.dart';
import 'package:mobmart_app/app/getx_managers/middlewares/onboard_guard_middleware.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
        name: Routes.initial,
        page: () => SplashScreenPage(),
        binding: SplashBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.onboarding,
        page: () => const OnboardingPage(),
        binding: OnboardingBinding(),
        middlewares: [OnboardGuardMiddleware()]),
    GetPage(
        name: Routes.landing,
        page: () => LandingPage(),
        binding: LandingBinding(),
        middlewares: [AuthGuardMiddleware()]),
    GetPage(
        name: Routes.accountSuccess,
        binding: AuthBinding(),
        page: () => const SuccessPage()),
    GetPage(
        name: Routes.settings,
        binding: SettingsBinding(),
        page: () => const SettingsPage()),
    GetPage(
      name: Routes.signin,
      page: () => const SigninPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupPage(),
      binding: AuthBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
        name: Routes.home,
        page: () => const Home(),
        binding: HomeBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.details,
        page: () => const ProductDetailsPage(),
        binding: ProductDetailsBinding(),
        transition: Transition.downToUp),
  ];
}
