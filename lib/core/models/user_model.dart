// ignore_for_file: annotate_overrides, overridden_fields
import 'package:mobmart/core/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.deviceToken,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    required this.photo,
    required this.dob,
    required this.userType,
  }) : super(
            id: id,
            email: email,
            name: name,
            photo: photo,
            dob: dob,
            phone: phone,
            deviceToken: deviceToken,
            verified: verified,
            createdAt: createdAt,
            updatedAt: updatedAt,
            userType: userType);

  final int id;
  final String email;
  final String name;
  final String photo;
  final DateTime dob;
  final String phone;
  final String deviceToken;
  final bool verified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userType;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print(json);

    return UserModel(
      id: json["id"] ?? 0,
      email: json["email"] ?? "",
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
      deviceToken: json["deviceToken"] ?? "",
      verified: json["verified"] ?? false,
      photo: json["photo"] ?? "",
      dob: DateTime.parse(json["dob"] != null && json["dob"] != ''? json["dob"] :  DateTime.now().toIso8601String()),
      createdAt:
          DateTime.parse(json["createdAt"] ?? DateTime.now().toIso8601String()),
      updatedAt:
          DateTime.parse(json["updatedAt"] ?? DateTime.now().toIso8601String()),
      userType: json["userType"] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "username": name,
        "phone": phone,
        "deviceToken": deviceToken,
        "verified": verified,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userType": userType,
      };
}
