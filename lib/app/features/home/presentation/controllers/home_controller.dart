import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';
import 'package:mobmart/app/features/home/domain/entities/carousel_entity.dart';
import 'package:mobmart/app/features/home/domain/entities/category_entity.dart';
import 'package:mobmart/app/features/home/domain/usecases/fetch_carousel_usecase.dart';
import 'package:mobmart/app/features/home/domain/usecases/fetch_categories_usecase.dart';
import 'package:mobmart/app/features/home/domain/usecases/fetch_products_usecase.dart';
import 'package:mobmart/app/routes/app_pages.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/parameters/no_params.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:get/get.dart' hide Trans;

class HomeController extends GetxController {
  final FetchCarouselUsecase fetchCarouselUsecase;
  final FetchCategoriesUsecase fetchCategoriesUsecase;
  final FetchProductsUsecase fetchProductsUsecase;
  HomeController(
      {required this.fetchCarouselUsecase,
      required this.fetchProductsUsecase,
      required this.fetchCategoriesUsecase});

  final ScrollController scrollController = ScrollController();

  final _carousels = <CarouselEntity>[].obs;
  final _categories = <CategoryEntity>[].obs;
  final _productModelList = <ProductModel>[].obs;
  final _favouriteProductModelList = <ProductModel>[].obs;
  final _currentCarouselIndex = 0.obs;
  final _carouselBackgroundColor = Colors.transparent.obs;
  final _carouselRequestStatus = RequestStatus.initial.obs;
  final _productsRequestStatus = RequestStatus.initial.obs;
  final _categoriesRequestStatus = RequestStatus.initial.obs;
  final _appBarExpanded = true.obs;

  List<CarouselEntity> get carouselsList => _carousels;
  List<CategoryEntity> get categoriesList => _categories;
  List<ProductModel> get productModelList => _productModelList;
  List<ProductModel> get favouriteProductModelList =>
      _favouriteProductModelList;
  Color get carouselBackgroundColor => _carouselBackgroundColor.value;
  RequestStatus get carouselRequestStatus => _carouselRequestStatus.value;
  RequestStatus get categoriesRequestStatus => _categoriesRequestStatus.value;
  RequestStatus get productsRequestStatus => _productsRequestStatus.value;
  int get currentCarouselIndex => _currentCarouselIndex.value;
  bool get appBarExpanded => _appBarExpanded.value;

  set carouselsList(value) => _carousels.value = value;
  set categoriesList(value) => _categories.value = value;
  set productModelList(value) => _productModelList.value = value;
  set favouriteProductModelList(value) =>
      _favouriteProductModelList.value = value;
  set carouselRequestStatus(value) => _carouselRequestStatus.value = value;
  set categoriesRequestStatus(value) => _categoriesRequestStatus.value = value;
  set productsRequestStatus(value) => _productsRequestStatus.value = value;
  set carouselBackgroundColor(value) => _carouselBackgroundColor.value = value;
  set currentCarouselIndex(value) => _currentCarouselIndex.value = value;
  set appBarExpanded(value) => _appBarExpanded.value = value;

  PaletteGenerator? paletteGenerator;
  List<PaletteColor> carouselPaletteColorList = <PaletteColor>[];
  @override
  onInit() {
    super.onInit();
    fetchCarousel();
    fetchCategories();
    fetchProducts();

  
  }

  fetchCategories() async {
    categoriesRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchCategoriesUsecase(NoParams());
    failOrFetch.fold((l) {
      categoriesRequestStatus = RequestStatus.error;
    }, (r) {
      categoriesList = r;
      categoriesRequestStatus = RequestStatus.success;
    });
  }

  fetchCarousel() async {
    carouselRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchCarouselUsecase(NoParams());
    failOrFetch.fold((l) {
      carouselRequestStatus = RequestStatus.error;
    }, (r) async {
      carouselsList = r;
      await generateBackgroundColor();

      carouselRequestStatus = RequestStatus.success;
    });
  }

  fetchProducts() async {
    productsRequestStatus = RequestStatus.loading;
    final failOrFetch = await fetchProductsUsecase(NoParams());
    failOrFetch.fold((l) {
      productsRequestStatus = RequestStatus.error;
    }, (r) async {
      productModelList = r;

      productsRequestStatus = RequestStatus.success;
    });
  }

  generateBackgroundColor() async {
    for (var element in carouselsList) {
      await PaletteGenerator.fromImageProvider(AssetImage(element.image))
          .then((value) => carouselPaletteColorList.add(value.dominantColor!));
    }
    carouselBackgroundColor = carouselPaletteColorList.first.color;
  }

  viewProductDetails({required ProductModel productModel}) {
    Get.toNamed(Routes.details, arguments: productModel);
  }
}
