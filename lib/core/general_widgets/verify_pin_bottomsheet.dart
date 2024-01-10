import 'dart:async';
import 'dart:ui';

import 'package:mobmart_app/app/features/auth/presentation/widgets/pin_themes.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';
import 'package:mobmart_app/core/general_widgets/custom_simple_loading_widget.dart';
import 'package:pinput/pinput.dart';

class MyValueNotifier extends ValueNotifier<int> {
  MyValueNotifier({required int start}) : super(start);
}

// ignore: must_be_immutable
class VerifyPinBottomSheet extends StatelessWidget {
  final VoidCallback onResendPin;
  final void Function(String) confirmPin;
  final bool isLoading;
  final String title;
  final String subTitle;
  VerifyPinBottomSheet(
      {super.key,
      required this.onResendPin,
      required this.confirmPin,
      required this.isLoading,
      required this.title,
      required this.subTitle}) {
    startTimer();
  }

  final MyValueNotifier myValueNotifier = MyValueNotifier(start: 60);
  int nextResendTime = 120;
  String formatedTime(int secTime) {
    String getParsedTime(String time) {
      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime % 60;
    String parsedTime =
        "${min == 0 ? '' : "${getParsedTime(min.toString())}m, "}${getParsedTime(sec.toString())}s";

    return parsedTime;
  }

  startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (myValueNotifier.value == 0) {
          timer.cancel();
        } else {
          myValueNotifier.value = myValueNotifier.value - 1;
        }
      },
    );
  }

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
          shrinkWrap: true,
          children: [
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV32.value),
            Text(
             title,
              style: primaryTextTheme.displayMedium,
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV16.value),
            Text(
             subTitle,
              style: primaryTextTheme.bodyLarge,
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV32.value),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              errorPinTheme: errorPinTheme,
              senderPhoneNumber: '070390938398',
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: ((pin) {
                confirmPin(pin);
                myValueNotifier.value = 60;
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                    valueListenable: myValueNotifier,
                    builder: (context, value, child) {
                      return Text(
                        value == 0
                            ? LocaleKeysAuthFieldText.didnotReceiveCode
                            : nextResendTime == 120
                                ? LocaleKeysAuthFieldText.codeToBeResentAfter
                                : LocaleKeysAuthFieldText.nextCodeToResentAfter,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 15),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: myValueNotifier,
                    builder: (context, value, child) {
                      return TextButton(
                          onPressed: myValueNotifier.value == 0
                              ? () {
                                  // _.resendOTP();
                                  print("omo");

                                  myValueNotifier.value = nextResendTime;
                                  nextResendTime = nextResendTime * 2;
                                  startTimer();
                                }
                              : null,
                          child: Text(
                            myValueNotifier.value == 0
                                ? "RESEND"
                                : " ${formatedTime(value)}",
                            style: TextStyle(
                                color: myValueNotifier.value == 0
                                    ? Colors.green.shade300
                                    : Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ));
                    }),
                CustomListSpacing(
                    spacingValue: ListSpacingValue.spacingV8.value),
                if (isLoading)
                  const CustomSimpleLoadingWidget(
                    size: 15,
                  )
              ],
            ),
            CustomListSpacing(spacingValue: ListSpacingValue.spacingV32.value),
          ],
        ),
      ),
    );
  }
}
