class ReviewModel {
  final String name;
  final double rating;
  final String message;
  final String time;
  final String photo;

  ReviewModel({
    required this.name,
    required this.rating,
    required this.message,
    required this.time,
    required this.photo,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> json) => ReviewModel(
        name: json["name"],
        rating: json["rating"],
        message: json["message"],
        time: json["time"],
        photo: json["photo"]
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "rating": rating,
        "message": message,
        "time": time,
        "photo":photo
      };
}
