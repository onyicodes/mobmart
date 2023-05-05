import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobmart/app/features/home/domain/entities/carousel_entity.dart';
import 'package:mobmart/app/features/home/domain/entities/category_entity.dart';
import 'package:mobmart/app/features/home/domain/usecases/fetch_carousel_usecase.dart';
import 'package:mobmart/app/features/home/domain/usecases/fetch_categories_usecase.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/parameters/no_params.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:get/get.dart' hide Trans;

class HomeController extends GetxController {
  final FetchCarouselUsecase fetchCarouselUsecase;
  final FetchCategoriesUsecase fetchCategoriesUsecase;
  HomeController(
      {required this.fetchCarouselUsecase,
      required this.fetchCategoriesUsecase});

  final _carousels = <CarouselEntity>[].obs;
  final _categories = <CategoryEntity>[].obs;
  final _carouselBackgroundColor = Colors.transparent.obs;
  final _carouselRequestStatus = RequestStatus.initial.obs;
  final _categoriesRequestStatus = RequestStatus.initial.obs;

  List<CarouselEntity> get carouselsList => _carousels;
  List<CategoryEntity> get categoriesList => _categories;
  Color get carouselBackgroundColor => _carouselBackgroundColor.value;
  RequestStatus get carouselRequestStatus => _carouselRequestStatus.value;
  RequestStatus get categoriesRequestStatus => _categoriesRequestStatus.value;

  set carouselsList(value) => _carousels.value = value;
  set categoriesList(value) => _categories.value = value;
  set carouselRequestStatus(value) => _carouselRequestStatus.value = value;
  set categoriesRequestStatus(value) => _categoriesRequestStatus.value = value;
  set carouselBackgroundColor(value) => _carouselBackgroundColor.value = value;

  PaletteGenerator? paletteGenerator;
  List<PaletteColor> carouselPaletteColorList = <PaletteColor>[];
  @override
  onInit() {
    super.onInit();
    fetchCarousel();
    fetchCategories();
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
    print("calling carousel");
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

  generateBackgroundColor() async {
    for (var element in carouselsList) {
      await PaletteGenerator.fromImageProvider(AssetImage(element.image))
          .then((value) => carouselPaletteColorList.add(value.dominantColor!));
    }
    carouselBackgroundColor = carouselPaletteColorList.first.color;
  }
}
