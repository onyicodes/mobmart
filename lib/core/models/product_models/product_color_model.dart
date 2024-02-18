import 'dart:convert';

class ProductColor {
  final int id;
  final int? aboutProductId;
  final String? image;
  final String colorCode;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductColor({
    required this.id,
    this.aboutProductId,
    this.image,
    required this.colorCode,
    this.createdAt,
    this.updatedAt,
  });

  ProductColor copyWith({
    int? id,
    int? aboutProductId,
    String? image,
    String? colorCode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ProductColor(
        id: id ?? this.id,
        aboutProductId: aboutProductId ?? this.aboutProductId,
        image: image ?? this.image,
        colorCode: colorCode ?? this.colorCode,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ProductColor.fromRawJson(String str) =>
      ProductColor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        id: json["id"],
        aboutProductId: json["aboutProductId"],
        image: json["image"],
        colorCode: json["colorCode"]??"",
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
        "image": image,
        "colorCode": colorCode,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
