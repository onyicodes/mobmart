import 'package:get/get_connect/connect.dart';
import 'package:mobmart/core/constants/api_url/api_url.dart';
import 'package:mobmart/core/error/exceptions.dart';
import 'package:mobmart/core/network/network_info.dart';
import 'package:mobmart/core/parameters/auth/email_signup_params.dart';
import 'package:mobmart/core/parameters/auth/resend_verify_token_params.dart';
import 'package:mobmart/core/parameters/auth/verify_token_params.dart';

const baseUrl = 'https://www.olevelgurusapp.com/v3/index/languages';

abstract class SignupDataProvider extends GetConnect {
  Future<String> emailSignup({required SignupParams params});
  Future<String> verifyToken({required VerifyTokenParams params});
  Future<String> resendVerifyToken({required ResendVerifyTokenParams params});
}

class SignupDataProviderImpl extends SignupDataProvider {
  final NetworkInfo networkInfo;

  SignupDataProviderImpl({required this.networkInfo});

  @override
  Future<String> emailSignup({required SignupParams params}) async {
    Map<String, String> signupField = params.toMap();

    const String signupUrl = ApiUrls.baseUrl + ApiUrls.signup;

    final Response response = await post(signupUrl, signupField);

    if (await networkInfo.isConnected) {
      final Map<String, dynamic>? jsonString;

      jsonString = response.body;
      if (response.statusCode == 201) {
        // jsonString = jsonDecode(dummyResponse);
        if (jsonString != null && jsonString['success']) {
          return jsonString["message"];
        } else {
          if (jsonString != null) {
            throw jsonString['message'];
          }
          throw UnknownException();
        }
      } else if (response.statusCode == 400) {
        if (jsonString != null) {
          throw jsonString["message"];
        }
        throw BadRequestException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 409) {
        throw AccountExistException();
      } else if (response.statusCode == 500) {
        throw ServerException();
      } else {
        if (jsonString != null) {
          throw jsonString['message'];
        }
        throw UnknownException();
      }
    } else {
      throw NetworkException();
    }
  }



  @override
  Future<String> verifyToken({required VerifyTokenParams params}) async {
    Map<String, String> verifyTokenField = params.toMap();

    const String verifyTokenUrl = ApiUrls.baseUrl + ApiUrls.verifyToken;

    final Response response = await patch(verifyTokenUrl, verifyTokenField);

    if (await networkInfo.isConnected) {
      final Map<String, dynamic>? jsonString;

      jsonString = response.body;
      if (response.statusCode == 200) {
        if (jsonString != null && jsonString['success']) {
          return jsonString["message"];
        } else {
          if (jsonString != null) {
            throw jsonString['message'];
          }
          throw UnknownException();
        }
      } else if (response.statusCode == 400) {
        if (jsonString != null) {
          throw jsonString["message"];
        }
        throw BadRequestException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 500) {
        throw ServerException();
      } else {
        if (jsonString != null) {
          throw jsonString['message'];
        }
        throw UnknownException();
      }
    } else {
      throw NetworkException();
    }
  }


  @override
  Future<String> resendVerifyToken({required ResendVerifyTokenParams params}) async {
    Map<String, String> resendVerifyTokenField = params.toMap();

    const String resendVerifyTokenUrl = ApiUrls.baseUrl + ApiUrls.resendVerifyToken;

    final Response response = await post(resendVerifyTokenUrl, resendVerifyTokenField);

    if (await networkInfo.isConnected) {
      final Map<String, dynamic>? jsonString;

      jsonString = response.body;
      if (response.statusCode == 200) {
        if (jsonString != null && jsonString['success']) {
          return jsonString["message"];
        } else {
          if (jsonString != null) {
            throw jsonString['message'];
          }
          throw UnknownException();
        }
      } else if (response.statusCode == 400) {
        if (jsonString != null) {
          throw jsonString["message"];
        }
        throw BadRequestException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 500) {
        throw ServerException();
      } else {
        if (jsonString != null) {
          throw jsonString['message'];
        }
        throw UnknownException();
      }
    } else {
      throw NetworkException();
    }
  }
}
