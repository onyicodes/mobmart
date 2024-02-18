import 'dart:convert';

import 'package:mobmart_app/core/models/product_models/about_product_model.dart';
import 'package:mobmart_app/core/models/product_models/business_model.dart';
import 'package:mobmart_app/core/models/product_models/counts_model.dart';
import 'package:mobmart_app/core/models/product_models/shipping_info_model.dart';

class Products {
  final int id;
  final int? userId;
  final String title;
  final String description;
  final List<String> photo;
  final int oldPrice;
  final int newPrice;
  final int rating;
  final bool? soldout;
  final bool? deleted;
  final DateTime? validFrom;
  final DateTime? validTo;
  final bool? promoted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ShippingInfo? shippingInfo;
  final Business? business;
  final AboutProduct? aboutProduct;
  final Count? count;
  final DateTime? lastSeen;

  Products({
   required this.id,
    this.userId,
    required this.title,
    required this.description,
    required this.photo,
    required this.oldPrice,
    required this.newPrice,
    required this.rating,
    this.soldout,
    this.deleted,
    this.validFrom,
    this.validTo,
    this.promoted,
    this.createdAt,
    this.updatedAt,
    this.shippingInfo,
    this.business,
    this.aboutProduct,
    this.count,
    this.lastSeen,
  });

  Products copyWith({
    int? id,
    int? userId,
    String? title,
    String? description,
    List<String>? photo,
    int? oldPrice,
    int? newPrice,
    int? rating,
    int? businessId,
    bool? soldout,
    bool? deleted,
    DateTime? validFrom,
    DateTime? validTo,
    bool? promoted,
    bool? favorited,
    DateTime? createdAt,
    DateTime? updatedAt,
    ShippingInfo? shippingInfo,
    Business? business,
    AboutProduct? aboutProduct,
    Count? count,
    DateTime? lastSeen,
  }) =>
      Products(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        description: description ?? this.description,
        photo: photo ?? this.photo,
        oldPrice: oldPrice ?? this.oldPrice,
        newPrice: newPrice ?? this.newPrice,
        rating: rating ?? this.rating,
        soldout: soldout ?? this.soldout,
        deleted: deleted ?? this.deleted,
        validFrom: validFrom ?? this.validFrom,
        validTo: validTo ?? this.validTo,
        promoted: promoted ?? this.promoted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        shippingInfo: shippingInfo ?? this.shippingInfo,
        business: business ?? this.business,
        aboutProduct: aboutProduct ?? this.aboutProduct,
        count: count ?? this.count,
        lastSeen: lastSeen ?? this.lastSeen,
      );

  factory Products.fromRawJson(String str) =>
      Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        userId: json["userId"],
        title: json["title"]??"",
        description: json["description"]??"",
        photo: json["photo"] == null
            ? []
            : List<String>.from(json["photo"]!.map((x) => x)),
        oldPrice: json["oldPrice"],
        newPrice: json["newPrice"],
        rating: json["rating"],
        soldout: json["soldout"],
        deleted: json["deleted"],
        validFrom: json["validFrom"] == null
            ? null
            : DateTime.parse(json["validFrom"]),
        validTo:
            json["validTo"] == null ? null : DateTime.parse(json["validTo"]),
        promoted: json["promoted"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        shippingInfo: json["shippingInfo"] == null
            ? null
            : ShippingInfo.fromJson(json["shippingInfo"]),
        business: json["business"] == null
            ? null
            : Business.fromJson(json["business"]),
        aboutProduct: json["aboutProduct"] == null
            ? null
            : AboutProduct.fromJson(json["aboutProduct"]),
        count: json["_count"] == null ? null : Count.fromJson(json["_count"]),
        lastSeen:
            json["lastSeen"] == null ? null : DateTime.parse(json["lastSeen"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "title": title,
        "description": description,
        "photo": List<dynamic>.from(photo.map((x) => x)),
        "oldPrice": oldPrice,
        "newPrice": newPrice,
        "rating": rating,
        "soldout": soldout,
        "deleted": deleted,
        "validFrom": validFrom?.toIso8601String(),
        "validTo": validTo?.toIso8601String(),
        "promoted": promoted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "shippingInfo": shippingInfo?.toJson(),
        "business": business?.toJson(),
        "aboutProduct": aboutProduct?.toJson(),
        "_count": count?.toJson(),
        "lastSeen": lastSeen?.toIso8601String(),
      };
}
