import 'dart:convert';

import 'package:mobmart_app/core/models/product_models/category_model.dart';
import 'package:mobmart_app/core/models/product_models/product_color_model.dart';
import 'package:mobmart_app/core/models/product_models/product_size_model.dart';

class AboutProduct {
  final int id;
  final int productId;
  final String brandName;
  final String condition;
  final String material;
  final int weight;
  final List<ProductColor> colors;
  final List<Size> sizes;
  final Category? category;

  AboutProduct({
    required this.id,
    required this.productId,
    required this.brandName,
    required this.condition,
    required this.material,
    required this.weight,
    required this.colors,
    required this.sizes,
    this.category,
  });

  AboutProduct copyWith({
    int? id,
    int? productId,
    int? categoryId,
    String? brandName,
    String? condition,
    String? material,
    int? weight,
    List<ProductColor>? colors,
    List<Size>? sizes,
    Category? category,
  }) =>
      AboutProduct(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        brandName: brandName ?? this.brandName,
        condition: condition ?? this.condition,
        material: material ?? this.material,
        weight: weight ?? this.weight,
        colors: colors ?? this.colors,
        sizes: sizes ?? this.sizes,
        category: category ?? this.category,
      );

  factory AboutProduct.fromRawJson(String str) =>
      AboutProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AboutProduct.fromJson(Map<String, dynamic> json) => AboutProduct(
        id: json["id"],
        productId: json["productId"],
        brandName: json["brandName"] ?? "",
        condition: json["condition"] ?? "",
        material: json["material"] ?? "",
        weight: json["weight"] ?? 0,
        colors: json["colors"] == null
            ? []
            : List<ProductColor>.from(
                json["colors"]!.map((x) => ProductColor.fromJson(x))),
        sizes: json["sizes"] == null
            ? []
            : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "brandName": brandName,
        "condition": condition,
        "material": material,
        "weight": weight,
        "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
        "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
        "category": category?.toJson(),
      };
}
