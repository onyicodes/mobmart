// ignore_for_file: overridden_fields, annotate_overrides

import 'package:mobmart/app/features/signin/domain/entities/signin_entity.dart';
import 'package:mobmart/core/models/user_model.dart';

class SigninModel extends SigninEntity {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  const SigninModel({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  }) : super(user: user, accessToken: accessToken, refreshToken: refreshToken);

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
