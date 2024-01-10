import 'package:equatable/equatable.dart';

class ResetPasswordParams extends Equatable {
  final String password;
  final String confirmPasssword;
  final String token;

  const ResetPasswordParams({required this.password, required this.token, required this.confirmPasssword});

  Map<String, String> toMap() => {"password": password, "token": token};

  @override
  List<Object?> get props => [];
}
