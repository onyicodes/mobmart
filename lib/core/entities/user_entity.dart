import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.photo,
    required this.dob,
    required this.phone,
    required this.deviceToken,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    required this.userType,
  });

  final int id;
  final String email;
  final String name;
  final String phone;
  final String deviceToken;
  final bool verified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String photo;
  final DateTime dob;
  final String userType;

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        phone,
        deviceToken,
        verified,
        createdAt,
        userType,
        updatedAt
      ];
}
