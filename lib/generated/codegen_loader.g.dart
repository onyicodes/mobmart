// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "appName": "MobMart",
  "navBar": {
    "home": "Home",
    "voucher": "Voucher",
    "wallet": "Wallet",
    "cart": "Cart",
    "favourites": "Favourites",
    "settings": "Settings"
  },
  "buttons": {
    "reload": "Reload",
    "continue": "Continue",
    "cancel": "Cancel"
  },
  "error": {
    "networkError": "Connection error",
    "serverError": "Server error occurred",
    "noResultError": "Result not found",
    "unknownError": "An error occurred",
    "forBiddenError": "you don't have permission to access this resource",
    "badRequest": "Bad request",
    "notAuthorized": "You are not authorized to perform this action",
    "cachingFailed": "Cache failure",
    "AuthFieldValidationError": {
      "emailEmpty": "Email field cannot be empty",
      "fieldEmpty": "This field is required",
      "emailFormatWrong": "Enter a valid email address",
      "phoneEmpty": "Phone number has not been entered",
      "phoneFormatWrong": "wrong phone format entered",
      "userNameEmpty": "Username is required",
      "passwordEmpty": "Password is required",
      "passwordFormatWrong": "Password must be between 8 to 12 characters",
      "confirmPasswordMismatch": "Password does not match"
    },
    "createAccount": {
      "emailExists": "Email already exist"
    },
    "login": {
      "failedLogin": "You have entered an invalid username or password",
      "accountNotFound": "Account not found!",
      "accountNotVerified": "Kindly verify your account to continue",
      "tokenNotFound": "You have entered an invalid token"
    }
  },
  "pages": {
    "auth": {
      "signInTitle": "Welcome back",
      "signInSubtitle": "Find the right product for you. Sell your products",
      "dontHaveAccountText": "Don't have an account?",
      "signUpTitle": "Join us in making impact",
      "signUpSubtitle": "Find the right product for you. Sell your products",
      "emailLabel": "E-mail",
      "emailHint": "abc@example",
      "nameLabel": "Name",
      "nameHint": "Jane Doe",
      "passwordLabel": "Password",
      "passwordHint": "**********",
      "phoneLabel": "Phone",
      "phoneHint": "07000000000",
      "forgotPasword": "Forgot password",
      "alreadyHaveAccountText": "Already have an account?",
      "continueToApp": "Continue to app",
      "forgotPasswordEnterEmailText": "Enter the email associated with your account for the verification proccesss and we will send 6 digits verification code to your email.",
      "verifyAccountTitle": "Verify your account",
      "verifyAccountBody": "Enter the 6 digits code that you received on your email.",
      "didnotReceiveCode": "Didn't receive the code?  ",
      "codeToBeResentAfter": "Code can be resent after",
      "nextCodeToBeAfter": "Next code can be send after",
      "resetPasswordTitle": "Reset Password",
      "resetPasswordBody": "Set the new password for your account so you can login and access all the features.",
      "newPasswordHint": "New Password",
      "confirmNewPasswordHint": "Confirm Password",
      "buttons": {
        "signinLabel": "Sign in",
        "signupLabel": "Sign up",
        "verifyNow": "Verify now",
        "RESEND": "RESEND"
      }
    },
    "settings": {
      "logoutSuccess": "Log out successful"
    }
  },
  "snackBar": {
    "signUp": {
      "accountSuccess": "Account Successfully registered",
      "passwordRequirements": "Check password field requirements",
      "AccountVerified": "Account verified successfully",
      "VerificationResent": "A token has been sent to your email"
    },
    "recoverAccount": {
      "passwordResetSuccess": "Password reset was successful. Log in with your new password"
    }
  },
  "onboarding": {
    "buttons": {
      "skip": "Skip",
      "next": "Next",
      "getStarted": "Get started"
    },
    "contents": {
      "page1": {
        "image": "assets/images/onboarding/onboard_image_1.png",
        "title": "Create a FREE account\n& find new customers",
        "subtitle": "Find the right market"
      },
      "page2": {
        "image": "assets/images/onboarding/onboard_image_2.png",
        "title": "Advertise special\ndeals, events & more",
        "subtitle": "Find the right market"
      },
      "page3": {
        "image": "assets/images/onboarding/onboard_image_3.png",
        "title": "Promote your\nlocation",
        "subtitle": "Find the right market"
      }
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
