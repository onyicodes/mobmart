import 'package:equatable/equatable.dart';

class SignupParams extends Equatable {
  final String email;
  final String name;
  final String phone;
  final String password;
  final String provider;
  final String countryCode;

  const SignupParams({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
    required this.provider,
    required this.countryCode
  });

  Map<String, String> toMap() =>
      {"email": email, "password": password, "name": name, "phone": phone, "provider":provider, "countryCode":countryCode};

  @override
  List<Object?> get props => [];
}
