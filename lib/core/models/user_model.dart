// ignore_for_file: annotate_overrides, overridden_fields
import 'package:mobmart/core/entities/user_entity.dart';

class UserModel extends UserEntity {
  const  UserModel({
        required this.id,
        required this.email,
        required this.username,
        required this.phone,
        required this.googleId,
        required this.facebookId,
        required this.twitterId,
        required this.appleId,
        required this.verified,
        required this.createdAt,
        required this.updatedAt,
        required this.photo,
        required this.dob,
        required this.role,
    }):super(id:id, email:email, username:username, photo: photo,dob: dob, phone: phone, googleId: googleId,
    facebookId: facebookId, twitterId: twitterId, appleId: appleId,
    verified: verified, createdAt: createdAt, updatedAt: updatedAt, role: role);

    final int id;
    final String email;
    final String username;
    final String photo;
  final DateTime dob;
    final String phone;
    final String googleId;
    final String facebookId;
    final String twitterId;
    final String appleId;
    final bool verified;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String role;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"]??0,
        email: json["email"] ??"",
        username: json["username"] ?? "",
        phone: json["phone"] ?? "",
        googleId: json["googleId"] ?? "",
        facebookId: json["facebookId"] ?? "",
        twitterId: json["twitterId"] ?? "",
        appleId: json["appleId"] ?? "",
        verified: json["verified"] ?? false,
        photo: json["photo"] ?? "",
        dob: DateTime.parse(json["dob"]??DateTime.now().toIso8601String()),
        createdAt: DateTime.parse(json["createdAt"]??DateTime.now().toIso8601String()),
        updatedAt: DateTime.parse(json["updatedAt"]??DateTime.now().toIso8601String()),
        role: json["role"] ?? "",
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "username": username,
        "phone": phone,
        "googleId": googleId,
        "facebookId": facebookId,
        "twitterId": twitterId,
        "appleId": appleId,
        "verified": verified,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "role": role,
    };
}