import 'dart:convert';

class Size {
  final int? id;
  final int? aboutProductId;
  final String? size;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Size({
    this.id,
    this.aboutProductId,
    this.size,
    this.createdAt,
    this.updatedAt,
  });

  Size copyWith({
    int? id,
    int? aboutProductId,
    String? size,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Size(
        id: id ?? this.id,
        aboutProductId: aboutProductId ?? this.aboutProductId,
        size: size ?? this.size,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Size.fromRawJson(String str) => Size.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json["id"],
        aboutProductId: json["aboutProductId"],
        size: json["size"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "aboutProductId": aboutProductId,
        "size": size,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
