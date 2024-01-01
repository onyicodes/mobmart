import 'package:mobmart/app/features/signin/presentation/controllers/signin_controller.dart';
import 'package:mobmart/app/features/signin/presentation/widgets/forgot_password_bottomsheet.dart';
import 'package:mobmart/core/auth_field/custom_auth_field.dart';
import 'package:mobmart/core/auth_field/password_textfield.dart';
import 'package:mobmart/core/constants/assets_constants.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/button_widget.dart';
import 'package:mobmart/core/general_widgets/custom_list_space.dart';
import 'package:mobmart/core/parameters/auth/signin_params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninPage extends GetView<SigninController> {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      body: GetX<SigninController>(builder: (_) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsConstants.appBg),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
              Text(
                'Welcome back',
                textAlign: TextAlign.center,
                style: primaryTextTheme.displayMedium,
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
              Text(
                'You can search course, apply course and find scholarship for abroad studies',
                textAlign: TextAlign.center,
                style: primaryTextTheme.bodyLarge,
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
              // const SocialSignups(),
              CustomAuthField(
                  controller: _.emailAddressController,
                  hintText: 'abc@example.com',
                  label: 'E-mail',
                  errorText: _.emailError,
                  onChanged: (String value) {
                    if (_.emailError.isNotEmpty) {
                      _.emailError = '';
                    }
                  },
                  inputType: TextInputType.emailAddress),
              PasswordTextField(
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
                  hintText: '***********'),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          _.forgotPassword(bottomsheet: const ForgotPassword());
                        },
                        child: Text(
                          'Forgot password',
                          style: primaryTextTheme.headlineMedium!
                              .copyWith(color: Theme.of(context).primaryColor),
                        )),
                    const SizedBox()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(
                  label: 'Sign in',
                  onPressed: () {
                    _.signin(
                        params: SigninParams(
                      email: _.emailAddressController.text,
                      password: _.passwordController.text,
                    ));
                  },
                  radius: 12,
                  height: 55,
                  loading: _.requestStatus == RequestStatus.loading,
                  textStyle: primaryTextTheme.headlineMedium!,
                  backgroundColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: primaryTextTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                      onPressed: () {
                        _.goToSignup();
                      },
                      child: Text(
                        'Join us',
                        style: primaryTextTheme.headlineMedium!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ))
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
