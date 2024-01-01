import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
 const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.photo,
    required this.dob,
    required this.phone,
    required this.googleId,
    required this.facebookId,
    required this.twitterId,
    required this.appleId,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
  });

  final int id;
  final String email;
  final String username;
  final String phone;
  final String googleId;
  final String facebookId;
  final String twitterId;
  final String appleId;
  final bool verified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String photo;
  final DateTime dob;
  final String role;

  @override
  List<Object?> get props => [
        id,
        email,
        username,
        phone,
        googleId,
        facebookId,
        twitterId,
        appleId,
        verified,
        createdAt,
        role,
        updatedAt
      ];
}
