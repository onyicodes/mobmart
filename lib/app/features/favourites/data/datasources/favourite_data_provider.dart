import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';
import 'package:mobmart_app/core/error/exceptions.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';

abstract class FavouriteDataProvider extends GetConnect {
  Future<List<Products>> fetchFavouriteProducts();
}

class FavouriteDataProviderImpl extends FavouriteDataProvider {
  FirebaseFirestore firebaseDb;
  FavouriteDataProviderImpl({required this.firebaseDb});

  @override
  Future<List<Products>> fetchFavouriteProducts() async {
    final String response =
        await rootBundle.loadString('assets/json_contents/home/products.json');

    final Map<String, dynamic> jsonMap;
    jsonMap = jsonDecode(response);

    final List productJsonList = jsonMap["data"];
    if (productJsonList.isNotEmpty) {
      throw NotFoundException();
    }

    return productJsonList
        .map((carouselJson) => Products.fromJson(carouselJson))
        .toList();
  }
}
