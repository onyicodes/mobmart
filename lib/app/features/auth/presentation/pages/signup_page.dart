import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobmart_app/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:mobmart_app/core/general_widgets/auth_field/custom_auth_field.dart';
import 'package:mobmart_app/core/general_widgets/auth_field/password_check.dart';
import 'package:mobmart_app/core/general_widgets/auth_field/password_textfield.dart';
import 'package:mobmart_app/core/constants/assets_constants.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/auth_field/phone_number_text_field.dart';
import 'package:mobmart_app/core/general_widgets/button_widget.dart';
import 'package:mobmart_app/core/general_widgets/custom_list_space.dart';
import 'package:mobmart_app/core/general_widgets/social_signups.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      body: GetX<SignupController>(builder: (_) {
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
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV100.value),
              Text(
                LocaleKeysAuthFieldText.signupPageTitle,
                textAlign: TextAlign.center,
                style: primaryTextTheme.displayMedium,
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV12.value),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LocaleKeysAuthFieldText.signupPageSubtitle,
                  textAlign: TextAlign.center,
                  style: primaryTextTheme.bodyLarge,
                ),
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV12.value),
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
              CustomAuthField(
                  controller: _.userNameController,
                  hintText: LocaleKeysAuthFieldText.nameHint,
                  label: LocaleKeysAuthFieldText.nameLabel,
                  onChanged: (String value) {
                    if (_.userNameError.isNotEmpty) {
                      _.userNameError = '';
                    }
                  },
                  errorText: _.userNameError,
                  inputType: TextInputType.name),
              PhoneInputTextField(
                  controller: _.phoneController,
                  errorText: _.phoneError,
                  hintText: LocaleKeysAuthFieldText.phoneHint,
                  label: LocaleKeysAuthFieldText.phoneLabel,
                  onChanged: (phone) {
                    _.onPhoneChange(phone);
                  }),
              PasswordTextField(
                  controller: _.passwordController,
                  errorText: _.passwordError,
                  obscurePassword: _.obscurePasswordText,
                  label: LocaleKeysAuthFieldText.passwordLabel,
                  onChanged: (String value) {
                    _.checkPassword(text: value);
                  },
                  validationWidget: _.passwordController.text.isNotEmpty
                      ? PasswordCheck(
                          has8Characters: _.has8Characters,
                          hasLowercase: _.hasLowercase,
                          hasUppercase: _.hasUppercase,
                          hasNumber: _.hasNumber,
                          hasSpecialCharacter: _.hasSpecialCharacter)
                      : const SizedBox.shrink(),
                  toggleObscureText: () {
                    _.obscurePasswordText = !_.obscurePasswordText;
                  },
                  hintText: LocaleKeysAuthFieldText.passwordHint),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: CustomButton(
                  label: LocaleKeysAuthFieldText.signupButtonLabel,
                  onPressed: () {
                    _.signup();
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
                    LocaleKeysAuthFieldText.alreadyHaveAccountText,
                    style: primaryTextTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                      onPressed: () {
                        _.goToSignIn();
                      },
                      child: Text(
                        LocaleKeysAuthFieldText.signinButtonLabel,
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
