import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobmart/app/features/presentation/controllers/splash_screen_controller.dart';
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
          children:const [
            Align(
                alignment: Alignment.center,
                child:SizedBox(
                  width: 150,
                  height: 150,
                  child: Image(image: AssetImage(AssetsConstants.logo))))
          ],
        ),
      ),
    );
  }
}
