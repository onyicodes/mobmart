import 'dart:ui';

import 'package:mobmart/app/features/auth/presentation/controllers/signin_controller.dart';
import 'package:mobmart/core/general_widgets/auth_field/password_textfield.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/button_widget.dart';
import 'package:mobmart/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
            CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV32.value),
            Text(
              'Reset password',
              style: primaryTextTheme.displayMedium,
            ),
            CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV16.value),
            Text(
              """Set the new password for your account so you can login and access all the features.""",
              style: primaryTextTheme.bodyLarge,
            ),
            CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV24.value),
            GetX<SigninController>(
              builder: (_) {
                return PasswordTextField(
                    controller: _.passwordController,
                    errorText: _.passwordError,
                    obscurePassword: _.obscurePasswordText,
                    label: 'Password',
                    onChanged: (String value) {
                      _.checkPasswordError();
                    },
                    toggleObscureText: () {
                      _.obscurePasswordText = !_.obscurePasswordText;
                    },
                    hintText: 'New password');
              },
            ),
            CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV8.value),
            GetX<SigninController>(
              builder: (_) {
                return PasswordTextField(
                    controller: _.passwordController,
                    errorText: _.passwordError,
                    obscurePassword: _.obscurePasswordText,
                    label: 'Password',
                    onChanged: (String value) {
                      _.checkPasswordError();
                    },
                    toggleObscureText: () {
                      _.obscurePasswordText = !_.obscurePasswordText;
                    },
                    hintText: 'Re-enter password');
              },
            ),
             CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV24.value),
            Center(
              child: GetBuilder<SigninController>(
                builder: (_) {
                  return CustomButton(
                      label: 'Continue',
                      onPressed: () {},
                      radius: 12,
                      width: 345,
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
