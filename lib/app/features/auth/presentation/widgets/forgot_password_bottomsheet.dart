import 'dart:ui';

import 'package:mobmart_app/app/features/auth/presentation/controllers/signin_controller.dart';
import 'package:mobmart_app/core/general_widgets/auth_field/custom_auth_field.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/button_widget.dart';
import 'package:mobmart_app/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  final VoidCallback recoverAccount;
  const ForgotPassword({super.key, required this.recoverAccount});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(minHeight: 350),
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
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV32.value),
            Text(
              LocaleKeysAuthFieldText.forgotPassword,
              style: primaryTextTheme.displayMedium,
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV24.value),
            Text(
              LocaleKeysAuthFieldText.forgotPasswordEnterEmailText,
              style: primaryTextTheme.bodyLarge,
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV32.value),
            GetX<SigninController>(
              builder: (_) {
                return CustomAuthField(
                    controller: _.recoverAccEmailAddressController,
                    hintText: LocaleKeysAuthFieldText.emailHint,
                    label: LocaleKeysAuthFieldText.emailLabel,
                    errorText: _.recoverAccEmailError,
                    onChanged: (String value) {
                      if (_.recoverAccEmailError.isNotEmpty) {
                        _.recoverAccEmailError = '';
                      }
                    },
                    inputType: TextInputType.emailAddress);
              },
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV32.value),
            Center(
              child: GetX<SigninController>(
                builder: (_) {
                  return CustomButton(
                      label: LocaleKeysAuthFieldText.continueButton,
                      onPressed: recoverAccount,
                      radius: 12,
                      width: 345,
                      loading:_.recoverAccRequestStatus == RequestStatus.loading,
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
