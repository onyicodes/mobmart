import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';

abstract class ProductDetailsDataProvider extends GetConnect {
  Future<List<ProductModel>> fetchRecommendations();
}

class ProductDetailsDataProviderImpl extends ProductDetailsDataProvider {
  @override
  Future<List<ProductModel>> fetchRecommendations() async {
    final String response = await rootBundle
        .loadString('assets/json_contents/home/recommended.json');

    final Map<String, dynamic> jsonMap;
    jsonMap = jsonDecode(response);

    final List recommendedJsonList = jsonMap["data"];

    print(recommendedJsonList);
    return recommendedJsonList
        .map((carouselJson) => ProductModel.fromMap(carouselJson))
        .toList();
  }
}
