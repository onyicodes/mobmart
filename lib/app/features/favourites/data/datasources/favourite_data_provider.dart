import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';
import 'package:mobmart/core/error/exceptions.dart';

abstract class FavouriteDataProvider extends GetConnect {
  Future<List<ProductModel>> fetchFavouriteProducts();
}

class FavouriteDataProviderImpl extends FavouriteDataProvider {
  FirebaseFirestore firebaseDb;
  FavouriteDataProviderImpl({required this.firebaseDb});

  @override
  Future<List<ProductModel>> fetchFavouriteProducts() async {
    final String response =
        await rootBundle.loadString('assets/json_contents/home/products.json');

    final Map<String, dynamic> jsonMap;
    jsonMap = jsonDecode(response);

    final List productJsonList = jsonMap["data"];
    if (productJsonList.isNotEmpty) {
      throw NotFoundException();
    }

    return productJsonList
        .map((carouselJson) => ProductModel.fromMap(carouselJson))
        .toList();
  }
}
