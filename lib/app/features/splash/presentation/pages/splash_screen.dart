import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobmart_app/app/features/splash/presentation/controllers/splash_screen_controller.dart';
import 'package:mobmart_app/core/constants/assets_constants.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  SplashScreenPage({super.key}) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    print("here also");
    return GetBuilder<SplashScreenController>(
      builder: (_) => Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsConstants.appBg),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 150,
                      height: 150,
                      child: SvgPicture.asset(
                        AssetsConstants.logoSvg,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
