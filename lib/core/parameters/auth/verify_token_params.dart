import 'package:equatable/equatable.dart';

class VerifyTokenParams extends Equatable {
  final String token;

  const VerifyTokenParams({
    required this.token,
  });

  Map<String, String> toMap() =>
      {"token": token};

  @override
  List<Object?> get props => [];
}
