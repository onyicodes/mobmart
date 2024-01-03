import 'package:mobmart/core/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class SigninEntity extends Equatable {
  final String accessToken;
  final String refreshToken;
  final UserEntity user;

  const SigninEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken, user];
}
