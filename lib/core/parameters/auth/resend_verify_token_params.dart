import 'package:equatable/equatable.dart';

class ResendVerifyTokenParams extends Equatable {
  final String email;

  const ResendVerifyTokenParams({
    required this.email,
  });

  Map<String, String> toMap() =>
      {"email": email};

  @override
  List<Object?> get props => [];
}
