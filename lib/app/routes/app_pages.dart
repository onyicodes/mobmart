import 'package:get/get.dart';
import 'package:mobmart/app/features/home/presentation/bindings/home_binding.dart';
import 'package:mobmart/app/features/home/presentation/pages/home.dart';
import 'package:mobmart/app/features/landing/presentation/bindings/landing_binding.dart';
import 'package:mobmart/app/features/landing/presentation/pages/landing_page.dart';
import 'package:mobmart/app/features/onboarding/presentation/bindings/onboard_binding.dart';
import 'package:mobmart/app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:mobmart/app/features/product_details/presentation/bindings/product_details_binding.dart';
import 'package:mobmart/app/features/product_details/presentation/pages/product_details_page.dart';
import 'package:mobmart/app/features/signin/presentation/bindings/signin_binding.dart';
import 'package:mobmart/app/features/signin/presentation/pages/signin_page.dart';
import 'package:mobmart/app/features/signup/presentation/bindings/signup_binding.dart';
import 'package:mobmart/app/features/signup/presentation/pages/signup_page.dart';
import 'package:mobmart/app/features/splash/presentation/bindings/splash_screen_binding.dart';
import 'package:mobmart/app/features/splash/presentation/pages/splash_screen.dart';
import 'package:mobmart/app/getx_managers/middlewares/auth_guard_middlewares.dart';
import 'package:mobmart/app/getx_managers/middlewares/onboard_guard_middleware.dart';

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
        middlewares: [OnboardGuardMiddleware()]
        ),
    GetPage(
        name: Routes.landing,
        page: () => LandingPage(),
        binding: LandingBinding(),
        middlewares: [AuthGuardMiddleware()]
        ),
     GetPage(
        name: Routes.signin,
        page: () => const SigninPage(),
        binding:SigninBinding(),
         transition: Transition.rightToLeft,
        ),
     GetPage(
      name: Routes.signup,
      page: () => const SignupPage(),
      binding: SignupBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
        name: Routes.home,
        page: () => const Home(),
        binding: HomeBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.details,
        page: () =>  const ProductDetailsPage(),
        binding: ProductDetailsBinding(),
        transition: Transition.downToUp),
  ];
}
