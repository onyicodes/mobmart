import 'package:flutter/material.dart';
import 'package:mobmart_app/app/features/favourites/domain/usecases/fetch_favourite_products_usecase.dart';
import 'package:mobmart_app/app/features/home/data/model/product_model.dart';
import 'package:mobmart_app/app/routes/app_pages.dart';
import 'package:mobmart_app/core/constants/failure_to_error_message.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/parameters/no_params.dart';
import 'package:get/get.dart' hide Trans;

class FavouriteController extends GetxController {
  final FetchFavouriteProductsUsecase fetchFavouriteProductsUsecase;
  FavouriteController({required this.fetchFavouriteProductsUsecase});

  final ScrollController scrollController = ScrollController();

  final _favouriteProductModelList = <ProductModel>[].obs;
  final _favProductsRequestStatus = RequestStatus.initial.obs;
  final _errorMessage = "".obs;

  List<ProductModel> get favouriteProductModelList =>
      _favouriteProductModelList;
  String get errorMessage => _errorMessage.value;
  RequestStatus get favProductsRequestStatus => _favProductsRequestStatus.value;
  set favouriteProductModelList(value) =>
      _favouriteProductModelList.value = value;
  set favProductsRequestStatus(value) =>
      _favProductsRequestStatus.value = value;
  set errorMessage(value) => _errorMessage.value = value;

  @override
  onInit() {
    super.onInit();
    fetchFavouriteProducts();
  }

  fetchFavouriteProducts() async {
    favProductsRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchFavouriteProductsUsecase(NoParams());
    failOrFetch.fold((failure) {
      favProductsRequestStatus = RequestStatus.error;
      errorMessage = failure.message.isNotEmpty
          ? failure.message
          : mapFailureToErrorMessage(failure);
    }, (r) async {
      favouriteProductModelList = [];

      favProductsRequestStatus = RequestStatus.success;
    });
  }

  updateFavouriteProduct({required ProductModel productModel}) {
    favouriteProductModelList
        .removeWhere((element) => element.id == productModel.id);
    update();
  }

  viewProductDetails({required ProductModel productModel}) {
    Get.toNamed(Routes.details, arguments: productModel);
  }
}
