import 'dart:ui';

import 'package:mobmart/app/features/signin/presentation/controllers/signin_controller.dart';
import 'package:mobmart/app/features/signin/presentation/widgets/pin_themes.dart';
import 'package:mobmart/app/features/signin/presentation/widgets/reset_password_bottomsheet.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/button_widget.dart';
import 'package:mobmart/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyPinBottomSheet extends StatelessWidget {
  final VoidCallback onResendPin;
  final VoidCallback confirmPin;
  final bool isLoading;
  final String title;
  final String subTitle;
  const VerifyPinBottomSheet({super.key, required this.onResendPin, required this.confirmPin, required this.isLoading, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Colors.white,
        ),
        child: ListView(
          children: [
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV32.value),
            Text(
              'Enter 6 Digits Code',
              style: primaryTextTheme.displayMedium,
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV16.value),
            Text(
              """Enter the 6 digits code that you received on your email.""",
              style: primaryTextTheme.bodyLarge,
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV32.value),
            GetBuilder<SigninController>(
              builder: (_) {
                return Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  errorPinTheme: errorPinTheme,
                  senderPhoneNumber: '070390938398',
                  validator: (s) {
                    return s == '2343' ? null : 'Incorrect pin';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) {
                    _.verifyPin(pin: pin);
                  },
                );
              },
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV24.value),
            Center(
              child: GetBuilder<SigninController>(
                builder: (_) {
                  return CustomButton(
                      label: 'Continue',
                      onPressed: () {
                        _.goToPResetPassword(
                            resetPwBottomsheet: const ResetPassword());
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
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV32.value),
          ],
        ),
      ),
    );
  }
}
