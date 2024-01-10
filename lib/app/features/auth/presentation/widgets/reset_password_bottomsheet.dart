import 'dart:ui';

import 'package:mobmart_app/app/features/auth/presentation/controllers/signin_controller.dart';
import 'package:mobmart_app/core/general_widgets/auth_field/password_check.dart';
import 'package:mobmart_app/core/general_widgets/auth_field/password_textfield.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/button_widget.dart';
import 'package:mobmart_app/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  final String pin;
  const ResetPassword({super.key, required this.pin});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height*0.8,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Colors.white,
        ),
        child: ListView(
          children: [
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV32.value),
            Text(
              LocaleKeysAuthFieldText.resetPasswordTitle,
              style: primaryTextTheme.displayMedium,
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV16.value),
            Text(
              LocaleKeysAuthFieldText.resetPasswordBody,
              style: primaryTextTheme.bodyLarge,
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV24.value),
            GetX<SigninController>(
              builder: (_) {
                return PasswordTextField(
                    controller: _.resetPasswordController,
                    errorText: _.resetPasswordError,
                    obscurePassword: _.obscureResetPasswordText,
                    label: LocaleKeysAuthFieldText.passwordLabel,
                    onChanged: (String value) {
                      _.checkPassword(text: value);
                    },
                    toggleObscureText: () {
                      _.obscureResetPasswordText = !_.obscureResetPasswordText;
                    },
                    validationWidget: _.startedTypingResetPw? PasswordCheck(
                        has8Characters: _.has8Characters,
                        hasLowercase: _.hasLowercase,
                        hasUppercase: _.hasUppercase,
                        hasNumber: _.hasNumber,
                        hasSpecialCharacter: _.hasSpecialCharacter):const SizedBox.shrink(),
                    hintText: LocaleKeysAuthFieldText.newPasswordHint);
              },
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV8.value),
            GetX<SigninController>(
              builder: (_) {
                return PasswordTextField(
                    controller: _.confirmPasswordController,
                    errorText: _.confirmPasswordError,
                    obscurePassword: _.obscureConfirmPasswordText,
                    label: LocaleKeysAuthFieldText.passwordLabel,
                    onChanged: (String value) {},
                    toggleObscureText: () {
                      _.obscureConfirmPasswordText =
                          !_.obscureConfirmPasswordText;
                    },
                    hintText: LocaleKeysAuthFieldText.conformNewPasswordHint);
              },
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV24.value),
            Center(
              child: GetX<SigninController>(
                builder: (_) {
                  return CustomButton(
                      label: LocaleKeysGeneralButtonText.continueButton,
                      onPressed: () {
                        _.resetPassword(pin: pin);
                      },
                      radius: 12,
                      width: 345,
                      loading:
                          _.resetPasswordRequestStatus == RequestStatus.loading,
                      borderColor: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).primaryColor,
                      textColor: const Color(0xffffffff),
                      textStyle: primaryTextTheme.headlineMedium!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
