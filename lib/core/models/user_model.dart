// ignore_for_file: annotate_overrides, overridden_fields
import 'dart:convert';

import 'package:mobmart_app/core/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String email;
  final String name;
  final String userType;
  final String photo;
  final DateTime dob;
  final String deviceToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool verified;
  final String phone;
  final DateTime lastSeen;
  final bool deleted;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.userType,
    required this.photo,
    required this.dob,
    required this.deviceToken,
    required this.createdAt,
    required this.updatedAt,
    required this.verified,
    required this.lastSeen,
    required this.phone,
    required this.deleted,
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

  UserModel copyWith({
    int? id,
    String? email,
    String? name,
    String? userType,
    String? photo,
    DateTime? dob,
    String? phone,
    String? deviceToken,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? verified,
    DateTime? lastSeen,
    bool? deleted,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        userType: userType ?? this.userType,
        photo: photo ?? this.photo,
        dob: dob ?? this.dob,
        phone:phone??this.phone,
        deviceToken: deviceToken ?? this.deviceToken,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        verified: verified ?? this.verified,
        lastSeen: lastSeen ?? this.lastSeen,
        deleted: deleted ?? this.deleted,
      );

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"]??"",
        name: json["name"],
        userType: json["userType"],
        photo: json["photo"]??"",
        dob: json["dob"],
        phone: json['phone'],
        deviceToken: json["deviceToken"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        verified: json["verified"],
        lastSeen: DateTime.parse(json["lastSeen"]),
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "userType": userType,
        "photo": photo,
        "dob": dob,
        "deviceToken": deviceToken,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "verified": verified,
        "lastSeen": lastSeen.toIso8601String(),
        "deleted": deleted,
      };
}
