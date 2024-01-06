import 'package:flutter/material.dart';

class PasswordCheck extends StatelessWidget {
  final bool has8Characters;
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumber;
  final bool hasSpecialCharacter;

  const PasswordCheck(
      {super.key,
      required this.has8Characters,
      required this.hasLowercase,
      required this.hasUppercase,
      required this.hasNumber,
      required this.hasSpecialCharacter});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Padding(
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
                  text: has8Characters ? '✅' : '•',
                  style: TextStyle(
                      color: has8Characters
                          ? Colors.green
                          : primaryTextTheme.titleMedium!.color),
                  children: const [TextSpan(text: ' At least  8 characters')])),
          const SizedBox(
            height: 2,
          ),
          RichText(
              text: TextSpan(
                  text: hasUppercase ? '✅' : '•',
                  style: TextStyle(
                      color: hasUppercase
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
                  text: hasLowercase ? '✅' : '•',
                  style: TextStyle(
                      color: hasLowercase
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
                  text: hasNumber ? '✅' : '•',
                  style: TextStyle(
                      color: hasNumber
                          ? Colors.green
                          : primaryTextTheme.titleMedium!.color),
                  children: const [TextSpan(text: ' At least  1 number')])),
          const SizedBox(
            height: 2,
          ),
          RichText(
              text: TextSpan(
                  text: hasSpecialCharacter ? '✅' : '•',
                  style: TextStyle(
                      color: hasSpecialCharacter
                          ? Colors.green
                          : primaryTextTheme.titleMedium!.color),
                  children: const [
                TextSpan(text: ' At least  1 special charater (eg. @?#!&)')
              ])),
        ],
      ),
    );
  }
}
