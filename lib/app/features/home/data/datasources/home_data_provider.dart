import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';
import 'package:mobmart/app/features/home/data/model/carousel_model.dart';
import 'package:mobmart/app/features/home/data/model/category_model.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';

abstract class HomeDataProvider extends GetConnect {
  Future<List<CarouselModel>> fetchCarousel();
  Future<List<CategoryModel>> fetchCategories();
  Future<List<ProductModel>> fetchProducts();
}

class HomeDataProviderImpl extends HomeDataProvider {
  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final String response = await rootBundle
        .loadString('assets/json_contents/home/categories.json');

    final List<dynamic> jsonStringContentList;
    jsonStringContentList = jsonDecode(response);

    return jsonStringContentList
        .map((categoryJson) => CategoryModel.fromMap(categoryJson))
        .toList();
  }

  @override
  Future<List<CarouselModel>> fetchCarousel() async {
    final String response =
        await rootBundle.loadString('assets/json_contents/home/carousel.json');

    final List<dynamic> carouselJsonList;
    carouselJsonList = jsonDecode(response);

    return carouselJsonList
        .map((carouselJson) => CarouselModel.fromMap(carouselJson))
        .toList();
  }

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final String response =
        await rootBundle.loadString('assets/json_contents/home/products.json');

    final Map<String, dynamic> jsonMap;
    jsonMap = jsonDecode(response);

    final List productJsonList = jsonMap["data"];

    print(productJsonList);
    return productJsonList
        .map((carouselJson) => ProductModel.fromMap(carouselJson))
        .toList();
  }
}
