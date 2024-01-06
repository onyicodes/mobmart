import 'package:mobmart/app/features/signin/data/model/signin_model.dart';
import 'package:mobmart/core/constants/api_url/api_url.dart';
import 'package:mobmart/core/error/exceptions.dart';
import 'package:mobmart/core/network/network_info.dart';
import 'package:mobmart/core/parameters/auth/signin_params.dart';
import 'package:get/get_connect/connect.dart';

abstract class SigninDataProvider extends GetConnect {
  Future<SigninModel> emailSignin({required SigninParams params});
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
        throw  FailedLoginException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 404) {
        throw AccountNotFoundException();
      } else if (response.statusCode == 409) {
        throw  AccountNotVerifiedException();
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
