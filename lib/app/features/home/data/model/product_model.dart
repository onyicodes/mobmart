// To parse this JSON data, do
//
//     final productEntity = productEntityFromMap(jsonString);

import 'package:mobmart/app/features/home/data/model/reviews_model.dart';
import 'package:mobmart/app/features/home/data/model/seller_info_model.dart';

import 'package:mobmart/app/features/home/data/model/shipping_model.dart';

class ProductModel {
  final int id;
  final String storeName;
  final String title;
  final String productType;
  final List<String> photo;
  final double ratings;
  final double price;
  final int amountSold;
  final String brand;
  final int totalReviews;
  final String color;
  final bool favourited;
  final String description;
  final ShippingInfoModel shippingInfo;
  final SellerInforModel sellerInfor;
  final List<String> storeReviewsWithMedia;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.id,
    required this.storeName,
    required this.title,
    required this.productType,
    required this.photo,
    required this.ratings,
    required this.price,
    required this.amountSold,
    required this.brand,
    required this.totalReviews,
    required this.color,
    required this.favourited,
    required this.description,
    required this.shippingInfo,
    required this.sellerInfor,
    required this.storeReviewsWithMedia,
    required this.reviews,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        storeName: json["storeName"],
        title: json["title"],
        productType: json["productType"],
        photo: List<String>.from(json["photo"].map((x) => x)),
        ratings: json["ratings"]?.toDouble(),
        price: json["price"],
        amountSold: json["amountSold"],
        brand: json["brand"],
        color: json["color"],
        totalReviews: json["totalReviews"],
        favourited: json["favourited"],
        description: json["description"],
        shippingInfo: ShippingInfoModel.fromMap(json["shippingInfo"]),
        sellerInfor: SellerInforModel.fromMap(json["sellerInfor"]),
        storeReviewsWithMedia:
            List<String>.from(json["storeReviewsWithMedia"].map((x) => x)),
        reviews: List<ReviewModel>.from(
            json["reviews"].map((x) => ReviewModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "storeName": storeName,
        "title": title,
        "productType": productType,
        "photo": List<dynamic>.from(photo.map((x) => x)),
        "ratings": ratings,
        "price": price,
        "amountSold": amountSold,
        "brand": brand,
        "color": color,
        "favourited": favourited,
        "description": description,
        "shippingInfo": shippingInfo.toMap(),
        "sellerInfor": sellerInfor.toMap(),
        "storeReviewsWithMedia":
            List<dynamic>.from(storeReviewsWithMedia.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toMap())),
      };
}
