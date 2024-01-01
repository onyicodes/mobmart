import 'package:equatable/equatable.dart';

class SignupParams extends Equatable {
  final String email;
  final String userName;
  final String phone;
  final String password;

  const SignupParams({
    required this.email,
    required this.userName,
    required this.phone,
    required this.password,
  });

  @override
  List<Object?> get props => [];
}
