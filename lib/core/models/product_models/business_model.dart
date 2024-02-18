import 'dart:convert';

class Business {
  final int id;
  final String name;
  final String description;
  final String photo;

  Business({
    required this.id,
    required this.name,
    required this.description,
    required this.photo,
  });

  Business copyWith({
    int? id,
    String? name,
    String? description,
    String? photo,
  }) =>
      Business(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        photo: photo ?? this.photo,
      );

  factory Business.fromRawJson(String str) =>
      Business.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        id: json["id"],
        name: json["name"]??"",
        description: json["description"]??"",
        photo: json["photo"]??"",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "photo": photo,
      };
}
