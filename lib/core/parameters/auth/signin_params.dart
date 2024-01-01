import 'package:equatable/equatable.dart';

///Used in passing in the login parameters
///
///The user property can be [email], [phone] (phone with the country code) or [username]
class SigninParams extends Equatable {
  final String email;
  final String password;

  const SigninParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [];
}
