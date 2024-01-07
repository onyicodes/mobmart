// ignore_for_file: overridden_fields, annotate_overrides

import 'package:mobmart_app/core/models/user_model.dart';

class SigninModel {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  const SigninModel({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory SigninModel.fromJson(Map<String, dynamic> json) {
    return SigninModel(
        accessToken: json['accessToken'] as String,
        refreshToken: json['refreshToken'] as String,
        user: UserModel.fromJson(json['user'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user'] = user;
    data["refreshToken"] = refreshToken;
    data["accessToken"] = accessToken;
    return data;
  }
}
