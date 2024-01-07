import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';
import 'package:mobmart_app/app/features/home/data/model/carousel_model.dart';
import 'package:mobmart_app/app/features/home/data/model/category_model.dart';
import 'package:mobmart_app/app/features/home/data/model/product_model.dart';
import 'package:mobmart_app/core/constants/api_url/api_url.dart';
import 'package:mobmart_app/core/error/exceptions.dart';
import 'package:mobmart_app/core/network/network_info.dart';

abstract class HomeDataProvider extends GetConnect {
  Future<List<CarouselModel>> fetchCarousel();
  Future<List<CategoryModel>> fetchCategories();
  Future<List<ProductModel>> fetchProducts();
}

class HomeDataProviderImpl extends HomeDataProvider {
  FirebaseFirestore firebaseDb;
  NetworkInfo networkInfo;
  HomeDataProviderImpl({required this.firebaseDb, required this.networkInfo});
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
    const String bannersUrl = ApiUrls.baseUrl + ApiUrls.banners;

    final Response response = await get(bannersUrl);

    if (await networkInfo.isConnected) {
      final Map<String, dynamic>? jsonString;

      jsonString = response.body;

      if (jsonString != null && jsonString['success']) {
        final List bannersJsonData = jsonString['data']["banners"];
        print(bannersJsonData);

        return bannersJsonData
            .map((carouselJson) => CarouselModel.fromJson(carouselJson))
            .toList();
      } else if (response.statusCode == 400) {
        if (jsonString != null) {
          throw jsonString['message'];
        }
        throw BadRequestException();
      } else if (response.statusCode == 401) {
        throw FailedLoginException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 404) {
        throw AccountNotFoundException();
      } else if (response.statusCode == 409) {
        throw AccountNotVerifiedException();
      } else if (response.statusCode == 500) {
        throw ServerException();
      } else {
        if (jsonString != null) {
          throw jsonString['message'];
        }
        throw UnknownException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final String response =
        await rootBundle.loadString('assets/json_contents/home/products.json');

    final Map<String, dynamic> jsonMap;
    jsonMap = jsonDecode(response);

    final List productJsonList = jsonMap["data"];

    return productJsonList
        .map((carouselJson) => ProductModel.fromMap(carouselJson))
        .toList();
  }
}
