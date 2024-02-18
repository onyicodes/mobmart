import 'dart:convert';

class Count {
  final int? review;
  final int? ordered;
  final int? favorites;

  Count({
    this.review,
    this.ordered,
    this.favorites
  });

  Count copyWith({
    int? review,
    int? ordered,
    int? favorites,
  }) =>
      Count(
        review: review ?? this.review,
        ordered: ordered ?? this.ordered,
        favorites: favorites?? this.favorites,
      );

  factory Count.fromRawJson(String str) => Count.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Count.fromJson(Map<String, dynamic> json) => Count(
        review: json["review"],
        ordered: json["ordered"],
        favorites: json["favorites"]
      );

  Map<String, dynamic> toJson() => {
        "review": review,
        "ordered": ordered,
        "favorites":favorites
      };
}
