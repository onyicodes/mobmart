import 'package:mobmart/core/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class SigninEntity extends Equatable {
  final String token;
  final UserEntity user;

  const SigninEntity({
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [token, user];
}
