import 'package:mobmart_app/app/features/auth/data/model/signin_model.dart';
import 'package:mobmart_app/core/constants/api_url/api_url.dart';
import 'package:mobmart_app/core/error/exceptions.dart';
import 'package:mobmart_app/core/network/network_info.dart';
import 'package:mobmart_app/core/parameters/auth/recover_account_params.dart';
import 'package:mobmart_app/core/parameters/auth/reset_password_params.dart';
import 'package:mobmart_app/core/parameters/auth/signin_params.dart';
import 'package:get/get_connect/connect.dart';

abstract class SigninDataProvider extends GetConnect {
  Future<SigninModel> emailSignin({required SigninParams params});
  Future<bool> recoverAccount({required RecoverAccountParams params});
  Future<bool> resetPassword({required ResetPasswordParams params});
}

class SigninDataProviderImpl extends SigninDataProvider {
  final NetworkInfo networkInfo;

  SigninDataProviderImpl({required this.networkInfo});

  @override
  Future<SigninModel> emailSignin({required SigninParams params}) async {
    Map<String, String> signupField = params.toMap();

    const String signinUrl = ApiUrls.baseUrl + ApiUrls.signin;

    final Response response = await post(signinUrl, signupField);

    if (await networkInfo.isConnected) {
      final Map<String, dynamic>? jsonString;

      jsonString = response.body;

      if (jsonString != null && jsonString['success']) {
        final Map<String, dynamic> signinJsonData = jsonString['data'];
        final signinModel = SigninModel.fromJson(signinJsonData);

        return signinModel;
      } else if (response.statusCode == 400) {
        if (jsonString != null) {
          throw jsonString['message'];
        }
        throw BadRequestException();
      } else if (response.statusCode == 401) {
        throw FailedLoginException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 404) {
        throw AccountNotFoundException();
      } else if (response.statusCode == 409) {
        throw AccountNotVerifiedException();
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
  Future<bool> recoverAccount({required RecoverAccountParams params}) async {
    Map<String, String> recoverAccountField = params.toMap();

    const String recoverAccountUrl = ApiUrls.baseUrl + ApiUrls.recoverAccount;

    final Response response =
        await patch(recoverAccountUrl, recoverAccountField);

    if (await networkInfo.isConnected) {
      final Map<String, dynamic>? jsonString;

      jsonString = response.body;

      if (jsonString != null && jsonString['success']) {
        return jsonString['success'];
      } else if (response.statusCode == 400) {
        throw BadRequestException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 404) {
        throw AccountNotFoundException();
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
  Future<bool> resetPassword({required ResetPasswordParams params}) async {
    Map<String, String> recoverAccountField = params.toMap();

    const String resetPasswordUrl = ApiUrls.baseUrl + ApiUrls.resetPassword;

    final Response response =
        await patch(resetPasswordUrl, recoverAccountField);

    if (await networkInfo.isConnected) {
      final Map<String, dynamic>? jsonString;

      jsonString = response.body;

      if (jsonString != null && jsonString['success']) {
        return jsonString['success'];
      } else if (response.statusCode == 400) {
        throw BadRequestException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 404) {
        throw NotFoundException();
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
