import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobmart_app/app/features/favourites/presentation/controllers/favourite_controller.dart';
import 'package:mobmart_app/app/features/home/presentation/controllers/home_controller.dart';
import 'package:mobmart_app/app/features/product_details/domain/usecases/fetch_cached_product_details_usecase.dart';
import 'package:mobmart_app/app/features/product_details/domain/usecases/fetch_product_details_usecase.dart';
import 'package:mobmart_app/app/features/product_details/domain/usecases/fetch_recommended_products_usecase.dart';
import 'package:mobmart_app/core/constants/failure_to_error_message.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/custom_snackbar.dart';
import 'package:mobmart_app/core/keys/cache_keys.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';
import 'package:mobmart_app/core/parameters/no_params.dart';
import 'package:mobmart_app/core/parameters/products/fetch_product_details_params.dart';

class ProductDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final FetchRecommendationsUsecase fetchRecommendationsUsecase;
  final FetchProductDetailsUsecase fetchProductDetailsUsecase;
  final FetchCachedProductDetailsUsecase fetchCachedProductDetailsUsecase;
  final GetStorage storebox;
  ProductDetailsController(
      {required this.fetchRecommendationsUsecase,
      required this.fetchCachedProductDetailsUsecase,
      required this.fetchProductDetailsUsecase,
      required this.storebox});

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
  final _errorMessage = "".obs;
  final _favourited = false.obs;
  final _recommendationsRequestStatus = RequestStatus.initial.obs;
  final _productsRequestStatus = RequestStatus.initial.obs;
  final _productModelList = <Products>[].obs;
  final _productsRecommended = <Products>[].obs;
  final _productModel = Rxn<Products>();

  List<Products> get productsRecommended => _productsRecommended;
  List<Products> get productModelList => _productModelList;
  Products? get productModel => _productModel.value;
  RequestStatus get recommendationsRequestStatus =>
      _recommendationsRequestStatus.value;
  RequestStatus get productsRequestStatus => _productsRequestStatus.value;
  int get imageIndexSelected => _imageIndexSelected.value;
  int get tabIndex => _tabIndex.value;
  String get selectedReviewOrder => _selectedReviewOrder.value;
  bool get showFavouriteSplash => _showFavouriteSplash.value;
  bool get favourited => _favourited.value;
  int get reviewPageNo => _reviewPageNo.value;
  int get numberOfReviewsPerPage => _numberOfReviewsPerPage.value;
  String get errorMessage => _errorMessage.value;

  set imageIndexSelected(value) => _imageIndexSelected.value = value;
  set tabIndex(value) => _tabIndex.value = value;
  set productModel(value) => _productModel.value = value;
  set selectedReviewOrder(value) => _selectedReviewOrder.value = value;
  set recommendationsRequestStatus(value) =>
      _recommendationsRequestStatus.value = value;
  set productsRequestStatus(value) => _productsRequestStatus.value = value;
  set productsRecommended(value) => _productsRecommended.value = value;
  set productModelList(value) => _productModelList.value = value;
  set showFavouriteSplash(value) => _showFavouriteSplash.value = value;
  set favourited(value) => _favourited.value = value;
  set reviewPageNo(value) => _reviewPageNo.value = value;
  set numberOfReviewsPerPage(value) => _numberOfReviewsPerPage.value = value;
  set errorMessage(value) => _errorMessage.value = value;

  List<String> reviewOrder = ["Popular", "Latest", "Oldest"];

  int reviewsNumberOfPages = 1;
  // late int reviewsNumberOfPages;
  int constantNumberOfReviewsPerPage = 3;
  late double initialScrollOffset;
  late int productId;
  late bool dataIsCached;

  @override
  onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    productId = Get.arguments;
    dataIsCached = storebox.hasData(CacheKeys.cacheProductDetails(productId));
    // favourited = checkFavourited(
    //     productModel: productModel,
    //     favouriteProductList: favouriteController.favouriteProductModelList);

    // reviewsNumberOfPages = reviewsNumberOfPagesDeterminer(
    //     totalContents: productModel.count,
    //     numberPerPage: numberOfReviewsPerPage);
    if (dataIsCached) {
      fetchCachedProductDetails();
    }
    fetchProductDetails();
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
      favouriteController.favouriteProductModelList.add(productModel!);
      showFavouriteSplash = true;
      Timer(const Duration(milliseconds: 900), () {
        showFavouriteSplash = false;
      });
    } else {
      favouriteController.favouriteProductModelList
          .removeWhere((element) => element.id == productModel?.id);
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
    // int remainingContentLength =
    //     productModel.reviews.length - index * constantNumberOfReviewsPerPage;
    // if (remainingContentLength >= constantNumberOfReviewsPerPage) {
    //   numberOfReviewsPerPage = constantNumberOfReviewsPerPage;
    // } else {
    //   numberOfReviewsPerPage = remainingContentLength;
    // }
    // reviewPageNo = index;
    // reviewPageController.jumpToPage(index);
  }

  fetchRecommendations() async {
    recommendationsRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchRecommendationsUsecase(NoParams());
    failOrFetch.fold((l) {
      recommendationsRequestStatus = RequestStatus.error;
    }, (r) async {
      productsRecommended = r;

      recommendationsRequestStatus = RequestStatus.success;
    });
  }

  fetchCachedProductDetails() async {
    productsRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchCachedProductDetailsUsecase(productId);
    failOrFetch.fold((l) {}, (r) async {
      productModel = r;
      favourited = productModel?.count?.favorites != 0;
      productsRequestStatus = RequestStatus.success;
    });
  }

  fetchProductDetails() async {
    productsRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchProductDetailsUsecase(
        ProductDetailsParams(productId: productId));
    failOrFetch.fold((l) {
      if (productModel == null) {
        errorMessage = mapFailureToErrorMessage(l);
        customSnackbar(title: "Erorr", message: errorMessage);

        productsRequestStatus = RequestStatus.error;
      }
    }, (r) async {
      productModel = r;
      favourited = productModel?.count?.favorites != 0;

      productsRequestStatus = RequestStatus.success;
    });
  }

  viewProductDetails({required Products product}) {
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
