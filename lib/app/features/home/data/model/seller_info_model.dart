class SellerInforModel {
  final String storeName;
  final String image;
  final String lastActive;
  final String storeRating;

  SellerInforModel({
    required this.storeName,
    required this.image,
    required this.lastActive,
    required this.storeRating,
  });

  factory SellerInforModel.fromMap(Map<String, dynamic> json) =>
      SellerInforModel(
        storeName: json["storeName"],
        image: json["image"],
        lastActive: json["lastActive"],
        storeRating: json["storeRating"],
      );

  Map<String, dynamic> toMap() => {
        "storeName": storeName,
        "image": image,
        "lastActive": lastActive,
        "storeRating": storeRating,
      };
}
