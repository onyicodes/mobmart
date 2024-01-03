import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';
import 'package:mobmart/core/constants/api_url/api_url.dart';
import 'package:mobmart/core/error/exceptions.dart';
import 'package:mobmart/core/parameters/auth/email_signup_params.dart';

const baseUrl = 'https://www.olevelgurusapp.com/v3/index/languages';

abstract class SignupDataProvider extends GetConnect {
  Future<String> emailSignup({required SignupParams params});
}

class SignupDataProviderImpl extends SignupDataProvider {
// Get request
  @override
  Future<String> emailSignup({required SignupParams params}) async {
    Map<String, String> signupField;

    signupField = {
      'email': params.email,
      'username': params.userName,
      'password': params.password
    };

    const String signupUrl = ApiUrls.baseUrl + ApiUrls.signin;

    final String dummyResponse = await rootBundle
        .loadString('assets/json_contents/auth/registration_response.json');
    //final Response response = await post(signupUrl, signupField);

    //if (response.statusCode == 200) {
    final Map<String, dynamic> jsonString;

    //jsonString = response.body;
    jsonString = jsonDecode(dummyResponse);
    if (jsonString['success']) {
      final String token = jsonString['data']['token'];

      return token;
    } else {
      throw UnknownException();
    }
    // } else {
    //   throw ServerException();
    //}
  }
}
