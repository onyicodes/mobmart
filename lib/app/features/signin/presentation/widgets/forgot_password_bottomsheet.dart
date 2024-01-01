import 'dart:ui';

import 'package:mobmart/app/features/signin/presentation/controllers/signin_controller.dart';
import 'package:mobmart/app/features/signin/presentation/widgets/pin_bottomsheet.dart';
import 'package:mobmart/core/auth_field/custom_auth_field.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/button_widget.dart';
import 'package:mobmart/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 350,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Colors.white,
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 4,
            ),
            // const Align(
            //     alignment: Alignment.topCenter, child: BottomSheetBorderLine()),
            CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV32.value),
            Text(
              'Forgot password',
              style: primaryTextTheme.displayMedium,
            ),
            CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV24.value),
            Text(
              """Enter your email for the verification proccesss,
we will send 4 digits code to your email.""",
              style: primaryTextTheme.bodyLarge,
            ),
            CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV32.value),
            GetX<SigninController>(
              builder: (_) {
                return CustomAuthField(
                    controller: _.emailAddressController,
                    hintText: 'abc@example.com',
                    label: 'E-mail',
                    errorText: _.emailError,
                    onChanged: (String value) {
                      if (_.emailError.isNotEmpty) {
                        _.emailError = '';
                      }
                    },
                    inputType: TextInputType.emailAddress);
              },
            ),
            CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV32.value),
            Center(
              child: GetBuilder<SigninController>(
                builder: (_) {
                  return CustomButton(
                      label: 'Continue',
                      onPressed: () {
                        _.goToPushToken(
                            pinBottomsheet: const VerifyPinBottomSheet());
                      },
                      radius: 12,
                      width: 345,
                      borderColor: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).primaryColor,
                      textColor: const Color(0xffffffff),
                      textStyle: primaryTextTheme.headlineMedium!);
                },
              ),
            ),
            CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV32.value),
          ],
        ),
      ),
    );
  }
}
