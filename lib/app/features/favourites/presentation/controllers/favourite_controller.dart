import 'package:flutter/material.dart';
import 'package:mobmart/app/features/favourites/domain/usecases/fetch_favourite_products_usecase.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';
import 'package:mobmart/app/routes/app_pages.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/parameters/no_params.dart';
import 'package:get/get.dart' hide Trans;

class FavouriteController extends GetxController {
  final FetchFavouriteProductsUsecase fetchFavouriteProductsUsecase;
  FavouriteController({required this.fetchFavouriteProductsUsecase});

  final ScrollController scrollController = ScrollController();

  final _favouriteProductModelList = <ProductModel>[].obs;
  final _favProductsRequestStatus = RequestStatus.initial.obs;

  List<ProductModel> get favouriteProductModelList =>
      _favouriteProductModelList;
  RequestStatus get favProductsRequestStatus => _favProductsRequestStatus.value;
  set favouriteProductModelList(value) =>
      _favouriteProductModelList.value = value;
  set favProductsRequestStatus(value) =>
      _favProductsRequestStatus.value = value;

  @override
  onInit() {
    super.onInit();
    fetchFavouriteProducts();
  }

  fetchFavouriteProducts() async {
    favProductsRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchFavouriteProductsUsecase(NoParams());
    failOrFetch.fold((l) {
      favProductsRequestStatus = RequestStatus.error;
    }, (r) async {
      favouriteProductModelList = r;

      favProductsRequestStatus = RequestStatus.success;
    });
  }

  viewProductDetails({required ProductModel productModel}) {
    Get.toNamed(Routes.details, arguments: productModel);
  }
}
