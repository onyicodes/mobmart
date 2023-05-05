import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';
import 'package:mobmart/app/features/home/data/model/carousel_model.dart';
import 'package:mobmart/app/features/home/data/model/category_model.dart';
import 'package:mobmart/app/features/home/domain/entities/carousel_entity.dart';
import 'package:mobmart/app/features/home/domain/entities/category_entity.dart';

abstract class HomeDataProvider extends GetConnect {
  Future<List<CarouselModel>> fetchCarousel();
  Future<List<CategoryModel>> fetchCategories();
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
    print(response);
    final List<dynamic> carouselJsonList;
    carouselJsonList = jsonDecode(response);
    print(carouselJsonList);

    return carouselJsonList
        .map((carouselJson) => CarouselModel.fromMap(carouselJson))
        .toList();
  }
}
