import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobmart/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:mobmart/core/constants/error_texts.dart';
import 'package:mobmart/core/constants/assets_constants.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/button_widget.dart';
import 'package:mobmart/core/general_widgets/custom_list_space.dart';

class SuccessPage extends GetView<SignupController> {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
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
            children: [
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV100.value),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV100.value),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(children: [
                  Lottie.asset(AssetsConstants.lottieCongratsBg),
                Lottie.asset(AssetsConstants.lottieCongratsText),
                ],),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: GetX<SignupController>(builder: (_) {
                    return CustomButton(
                      label: AuthFieldText.continueToAppButton,
                      onPressed: () {
                        _.signInUser(email: _.emailAddressController.text.trim(), password: _.passwordController.text);
                      },
                      radius: 12,
                      height: 55,
                      loading: _.signInRequestStatus == RequestStatus.loading,
                      textStyle: primaryTextTheme.headlineMedium!,
                      backgroundColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColor,
                    );
                  }
                ),
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV12.value),
              
            ],
          ),
        )
      
    );
  }
}
