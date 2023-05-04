import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobmart/app/features/splash/presentation/controllers/splash_screen_controller.dart';
import 'package:mobmart/core/constants/assets_constants.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({super.key});

 
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
     builder:(_)=> Scaffold(
        extendBodyBehindAppBar: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child:SizedBox(
                  width: 150,
                  height: 150,
                  child:  SvgPicture.asset(
                                        AssetsConstants.logoSvg,
                                        )))
          ],
        ),
      ),
    );
  }
}
