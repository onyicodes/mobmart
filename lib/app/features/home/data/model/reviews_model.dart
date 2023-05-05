class ReviewModel {
  final String name;
  final double rating;
  final String message;
  final String time;

  ReviewModel({
    required this.name,
    required this.rating,
    required this.message,
    required this.time,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> json) => ReviewModel(
        name: json["name"],
        rating: json["rating"],
        message: json["message"],
        time: json["time"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "rating": rating,
        "message": message,
        "time": time,
      };
}
