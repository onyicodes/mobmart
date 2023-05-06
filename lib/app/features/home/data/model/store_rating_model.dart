// To parse this JSON data, do
//
//     final storeRating = storeRatingFromMap(jsonString);

class StoreRatingModel {
  final int total;
  final double rating;
  final double positiveReviews;
  final int fiveStarRating;
  final int fourStarRating;
  final int twoStarRating;
  final int threeStarRating;
  final int oneStarRating;

  StoreRatingModel({
    required this.total,
    required this.rating,
    required this.positiveReviews,
    required this.fiveStarRating,
    required this.fourStarRating,
    required this.twoStarRating,
    required this.threeStarRating,
    required this.oneStarRating,
  });

  factory StoreRatingModel.fromMap(Map<String, dynamic> json) =>
      StoreRatingModel(
        total: json["total"]?.toInt(),
        rating: json["rating"],
        positiveReviews: json["positiveReviews"]?.toDouble(),
        fiveStarRating: json["fiveStarRating"],
        fourStarRating: json["fourStarRating"],
        twoStarRating: json["twoStarRating"],
        threeStarRating: json["threeStarRating"],
        oneStarRating: json["oneStarRating"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "rating":rating,
        "positiveReviews": positiveReviews,
        "fiveStarRating": fiveStarRating,
        "fourStarRating": fourStarRating,
        "twoStarRating": twoStarRating,
        "threeStarRating": threeStarRating,
        "oneStarRating": oneStarRating,
      };
}
