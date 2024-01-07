import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobmart_app/app/features/favourites/presentation/controllers/favourite_controller.dart';
import 'package:mobmart_app/app/features/home/data/model/product_model.dart';
import 'package:mobmart_app/app/features/home/presentation/controllers/home_controller.dart';
import 'package:mobmart_app/app/features/product_details/domain/usecases/fetch_products_usecase.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/parameters/no_params.dart';
import 'package:mobmart_app/core/util/check_favourited_products.dart';

class ProductDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final FetchRecommendationsUsecase fetchRecommendationsUsecase;
  ProductDetailsController({required this.fetchRecommendationsUsecase});

  final homeController = Get.find<HomeController>();
  final PageController reviewPageController = PageController();
  final ScrollController mainScrollController = ScrollController();

  final favouriteController = Get.find<FavouriteController>();

  late TabController tabController;

  final _imageIndexSelected = 0.obs;
  final _selectedReviewOrder = "Popular".obs;

  final _tabIndex = 0.obs;
  final _reviewPageNo = 0.obs;
  final _numberOfReviewsPerPage = 3.obs;
  final _showFavouriteSplash = false.obs;
  final _favourited = false.obs;
  final _productsRequestStatus = RequestStatus.initial.obs;
  final _productModelList = <ProductModel>[].obs;

  List<ProductModel> get productModelList => _productModelList;
  RequestStatus get productsRequestStatus => _productsRequestStatus.value;
  int get imageIndexSelected => _imageIndexSelected.value;
  int get tabIndex => _tabIndex.value;
  String get selectedReviewOrder => _selectedReviewOrder.value;
  bool get showFavouriteSplash => _showFavouriteSplash.value;
  bool get favourited => _favourited.value;
  int get reviewPageNo => _reviewPageNo.value;
  int get numberOfReviewsPerPage => _numberOfReviewsPerPage.value;

  set imageIndexSelected(value) => _imageIndexSelected.value = value;
  set tabIndex(value) => _tabIndex.value = value;
  set selectedReviewOrder(value) => _selectedReviewOrder.value = value;
  set productsRequestStatus(value) => _productsRequestStatus.value = value;
  set productModelList(value) => _productModelList.value = value;
  set showFavouriteSplash(value) => _showFavouriteSplash.value = value;
  set favourited(value) => _favourited.value = value;
  set reviewPageNo(value) => _reviewPageNo.value = value;
  set numberOfReviewsPerPage(value) => _numberOfReviewsPerPage.value = value;

  List<String> reviewOrder = ["Popular", "Latest", "Oldest"];

  late ProductModel productModel;

  late int reviewsNumberOfPages;
  int constantNumberOfReviewsPerPage = 3;
  late double initialScrollOffset;

  @override
  onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    productModel = Get.arguments;
    favourited = checkFavourited(
        productModel: productModel,
        favouriteProductList: favouriteController.favouriteProductModelList);
    ;

    reviewsNumberOfPages = reviewsNumberOfPagesDeterminer(
        totalContents: productModel.reviews.length,
        numberPerPage: numberOfReviewsPerPage);
    fetchRecommendations();
  }

  double ratingPercentageBarSize(
      {required barWidth,
      required int totalRatings,
      required int ratingGiven}) {
    return barWidth * (ratingGiven / totalRatings);
  }

  selectImage(int index) {
    imageIndexSelected = index;
  }

  displayFavouriteSplash() {
    if (favourited) {
      //optimistic design
      favouriteController.favouriteProductModelList.add(productModel);
      showFavouriteSplash = true;
      Timer(const Duration(milliseconds: 900), () {
        showFavouriteSplash = false;
      });
    } else {
      favouriteController.favouriteProductModelList
          .removeWhere((element) => element.id == productModel.id);
    }

    updateFavourite();
  }

  updateFavourite() {
    favouriteController.update();
    favouriteController.favProductsRequestStatus = RequestStatus.success;
    homeController.update();
  }

  int reviewsNumberOfPagesDeterminer(
      {required int totalContents, required int numberPerPage}) {
    return (totalContents / numberPerPage).ceil();
  }

  onReviewPageChange({required int index}) {
    int remainingContentLength =
        productModel.reviews.length - index * constantNumberOfReviewsPerPage;
    if (remainingContentLength >= constantNumberOfReviewsPerPage) {
      numberOfReviewsPerPage = constantNumberOfReviewsPerPage;
    } else {
      numberOfReviewsPerPage = remainingContentLength;
    }
    reviewPageNo = index;
    reviewPageController.jumpToPage(index);
  }

  fetchRecommendations() async {
    productsRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchRecommendationsUsecase(NoParams());
    failOrFetch.fold((l) {
      productsRequestStatus = RequestStatus.error;
    }, (r) async {
      productModelList = r;

      productsRequestStatus = RequestStatus.success;
    });
  }

  viewProductDetails({required ProductModel product}) {
    // Get.offNamedUntil(
    //     Routes.details, (route) => route.settings.name == Routes.home,
    //     arguments: product);
    productModel = product;
    super.notifyChildrens();
    scrollToTop();
    //Get.toNamed(Routes.details, arguments: product);
  }

  scrollToTop() {
    mainScrollController.animateTo(
        mainScrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut);
  }

  returnHome() {
    Get.back();
  }
}
