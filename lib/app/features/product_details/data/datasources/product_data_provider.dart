import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobmart_app/core/constants/api_url/api_url.dart';
import 'package:mobmart_app/core/error/exceptions.dart';
import 'package:mobmart_app/core/keys/cache_keys.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';
import 'package:mobmart_app/core/network/network_info.dart';
import 'package:mobmart_app/core/parameters/products/fetch_product_details_params.dart';

abstract class ProductDetailsDataProvider extends GetConnect {
  Future<List<Products>> fetchRecommendations();
  Future<Products> fetchProductDetails({required ProductDetailsParams params});
  Future<void> cacheProductDetails({required Products params});
  Future<Products> fetchCachedProductDetails({required int productId});
}

class ProductDetailsDataProviderImpl extends ProductDetailsDataProvider {
  NetworkInfo networkInfo;
  GetStorage storeBox;
  ProductDetailsDataProviderImpl(
      {required this.networkInfo, required this.storeBox});
  @override
  Future<List<Products>> fetchRecommendations() async {
    final String response = await rootBundle
        .loadString('assets/json_contents/home/recommended.json');

    final Map<String, dynamic> jsonMap;
    jsonMap = jsonDecode(response);

    final List recommendedJsonList = jsonMap["data"];

    return recommendedJsonList
        .map((carouselJson) => Products.fromJson(carouselJson))
        .toList();
  }

  @override
  Future<Products> fetchProductDetails(
      {required ProductDetailsParams params}) async {
    const String productsUrl = ApiUrls.baseUrl + ApiUrls.productDetails;

    final Response response = await get('$productsUrl/${params.productId}');

    if (await networkInfo.isConnected) {
      final Map<String, dynamic>? jsonString;

      jsonString = response.body;

      if (jsonString != null && jsonString['success']) {
        final productsJsonData = jsonString['data'];
        return Products.fromJson(productsJsonData);
      } else if (response.statusCode == 400) {
        throw BadRequestException();
      } else if (response.statusCode == 401) {
        throw NotAuthorizedException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 404) {
        throw NotFoundException();
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
  Future<Products> fetchCachedProductDetails({required int productId}) async {
    Map<String, dynamic> productJson =
        storeBox.read(CacheKeys.cacheProductDetails(productId));
    Products product = Products.fromJson(productJson);
    return product;
  }

  @override
  Future<void> cacheProductDetails({required Products params}) async {
    try {
      await storeBox.write(
          CacheKeys.cacheProductDetails(params.id), params.toJson());

    } catch (e) {
      throw CacheException();
    }
  }
}
