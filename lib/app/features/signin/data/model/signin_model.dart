// ignore_for_file: overridden_fields, annotate_overrides

import 'package:mobmart/app/features/signin/domain/entities/signin_entity.dart';
import 'package:mobmart/core/models/user_model.dart';

class SigninModel extends SigninEntity {
  final String token;
  final UserModel user;

  const SigninModel({
    required this.token,
    required this.user,
  }) : super(user: user, token: token);

  factory SigninModel.fromJson(Map<String, dynamic> json) {
    return SigninModel(
        token: json['token'] as String,
        user: UserModel.fromJson(json['user'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user'] = user;
    return data;
  }
}
