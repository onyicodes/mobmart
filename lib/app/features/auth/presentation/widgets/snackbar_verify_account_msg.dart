import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobmart_app/app/features/auth/presentation/controllers/signin_controller.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/custom_simple_loading_widget.dart';

class SnackBarVerifyAccountMsg extends StatelessWidget {
  const SnackBarVerifyAccountMsg({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context);
    return GetBuilder<SigninController>(builder: (_) {
      return SizedBox(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                            _.emailAddressController.text,
                            style: const TextStyle(decoration: TextDecoration.underline),
                          ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: primaryTextTheme.cardColor))),
                  onPressed: () {
                    if (Get.isSnackbarOpen) {
                      Get.closeAllSnackbars();
                    }
                  },
                  child: Text(LocaleKeysGeneralButtonText.cancelButton),
                ),
                TextButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            BorderSide(color: primaryTextTheme.primaryColor))),
                    onPressed: () {
                      _.verifyAccount();
                    },
                    child: GetX<SigninController>(builder: (_) {
                      return Row(
                        children: [
                          Text(
                           LocaleKeysAuthFieldText.verifyNowButton ,
                            style:
                                TextStyle(color: primaryTextTheme.primaryColor),
                          ),
                          if (_.sendVerificationRequestStatus ==
                              RequestStatus.loading)
                            const CustomSimpleLoadingWidget()
                        ],
                      );
                    })),
              ],
            )
          ],
        ),
      );
    });
  }
}
