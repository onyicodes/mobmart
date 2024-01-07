import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobmart_app/app/features/auth/presentation/controllers/signup_controller.dart';

class PasswordCheck extends StatelessWidget {
  const PasswordCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return GetX<SignupController>(builder: (_) {
      return _.startedTypingPw
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your password must have the following',
                    style: primaryTextTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                      text: TextSpan(
                          text: _.has8Characters ? '✅' : '•',
                          style: TextStyle(
                              color: _.has8Characters
                                  ? Colors.green
                                  : primaryTextTheme.titleMedium!.color),
                          children: const [
                        TextSpan(text: ' At least  8 characters')
                      ])),
                  const SizedBox(
                    height: 2,
                  ),
                  RichText(
                      text: TextSpan(
                          text: _.hasUppercase ? '✅' : '•',
                          style: TextStyle(
                              color: _.hasUppercase
                                  ? Colors.green
                                  : primaryTextTheme.titleMedium!.color),
                          children: const [
                        TextSpan(text: ' At least  1 uppercase letter')
                      ])),
                  const SizedBox(
                    height: 2,
                  ),
                  RichText(
                      text: TextSpan(
                          text: _.hasLowercase ? '✅' : '•',
                          style: TextStyle(
                              color: _.hasLowercase
                                  ? Colors.green
                                  : primaryTextTheme.titleMedium!.color),
                          children: const [
                        TextSpan(text: ' At least  1 lowercase letter')
                      ])),
                  const SizedBox(
                    height: 2,
                  ),
                  RichText(
                      text: TextSpan(
                          text: _.hasNumber ? '✅' : '•',
                          style: TextStyle(
                              color: _.hasNumber
                                  ? Colors.green
                                  : primaryTextTheme.titleMedium!.color),
                          children: const [
                        TextSpan(text: ' At least  1 number')
                      ])),
                  const SizedBox(
                    height: 2,
                  ),
                  RichText(
                      text: TextSpan(
                          text: _.hasSpecialCharacter ? '✅' : '•',
                          style: TextStyle(
                              color: _.hasSpecialCharacter
                                  ? Colors.green
                                  : primaryTextTheme.titleMedium!.color),
                          children: const [
                        TextSpan(
                            text: ' At least  1 special charater (eg. @?#!&)')
                      ])),
                ],
              ),
            )
          : Container();
    });
  }
}
