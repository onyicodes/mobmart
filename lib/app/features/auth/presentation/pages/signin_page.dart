import 'package:mobmart_app/app/features/auth/presentation/controllers/signin_controller.dart';
import 'package:mobmart_app/app/features/auth/presentation/widgets/forgot_password_bottomsheet.dart';
import 'package:mobmart_app/core/general_widgets/auth_field/custom_auth_field.dart';
import 'package:mobmart_app/core/general_widgets/auth_field/password_textfield.dart';
import 'package:mobmart_app/core/constants/assets_constants.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/button_widget.dart';
import 'package:mobmart_app/core/general_widgets/custom_list_space.dart';
import 'package:mobmart_app/core/general_widgets/social_signups.dart';
import 'package:mobmart_app/core/parameters/auth/signin_params.dart';
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
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsConstants.appBg),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            children: [
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV100.value),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  LocaleKeysAuthFieldText.signinPageTitle,
                  textAlign: TextAlign.center,
                  style: primaryTextTheme.displayMedium,
                ),
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  LocaleKeysAuthFieldText.signinPageSubtitle,
                  textAlign: TextAlign.center,
                  style: primaryTextTheme.bodyLarge,
                ),
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
              SocialSignups(
                onGoogleTap: () {
                  _.googleSignup();
                },
                onFbTap: () {
                  _.facebookSignup();
                },
              ),
              CustomAuthField(
                  controller: _.emailAddressController,
                  hintText: LocaleKeysAuthFieldText.emailHint,
                  label: LocaleKeysAuthFieldText.emailLabel,
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
                  label: LocaleKeysAuthFieldText.passwordLabel,
                  onChanged: (String value) {
                    _.checkPasswordError();
                  },
                  toggleObscureText: () {
                    _.obscurePasswordText = !_.obscurePasswordText;
                  },
                  hintText: LocaleKeysAuthFieldText.passwordHint),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                        
                          _.forgotPassword(bottomsheet: ForgotPassword(
                            recoverAccount: () {
                              _.recoverAccount();
                            },
                          ));
                        },
                        child: Text(
                          LocaleKeysAuthFieldText.forgotPassword,
                          style: primaryTextTheme.headlineMedium!
                              .copyWith(color: Theme.of(context).primaryColor),
                        )),
                    const SizedBox()
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: CustomButton(
                  label: LocaleKeysAuthFieldText.signinButtonLabel,
                  onPressed: () {
                    _.signin(
                        params: SigninParams(
                      email: _.emailAddressController.text.toLowerCase(),
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
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV12.value),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeysAuthFieldText.dontHaveAccountText,
                    style: primaryTextTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                      onPressed: () {
                        _.goToSignup();
                      },
                      child: Text(
                        LocaleKeysAuthFieldText.signupButtonLabel,
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
