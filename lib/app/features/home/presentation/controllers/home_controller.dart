import 'package:flutter/material.dart';
import 'package:mobmart_app/app/features/favourites/presentation/controllers/favourite_controller.dart';
import 'package:mobmart_app/app/features/home/domain/entities/carousel_entity.dart';
import 'package:mobmart_app/app/features/home/domain/entities/category_entity.dart';
import 'package:mobmart_app/app/features/home/domain/usecases/fetch_carousel_usecase.dart';
import 'package:mobmart_app/app/features/home/domain/usecases/fetch_categories_usecase.dart';
import 'package:mobmart_app/app/features/home/domain/usecases/fetch_products_usecase.dart';
import 'package:mobmart_app/app/routes/app_pages.dart';
import 'package:mobmart_app/core/constants/failure_to_error_message.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/custom_snackbar.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';
import 'package:mobmart_app/core/parameters/no_params.dart';
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
  final favouriteController = Get.find<FavouriteController>();

  final _carousels = <CarouselEntity>[].obs;
  final _categories = <CategoryEntity>[].obs;
  final _errorMessage = "".obs;
  final RxList<Products> _productModelList = <Products>[].obs;
  final _favouriteProductModelList = <Products>[].obs;
  final _currentCarouselIndex = 0.obs;
  final _carouselBackgroundColor = Colors.transparent.obs;
  final _carouselRequestStatus = RequestStatus.initial.obs;
  final _productsRequestStatus = RequestStatus.initial.obs;
  final _categoriesRequestStatus = RequestStatus.initial.obs;
  final _appBarExpanded = true.obs;

  List<CarouselEntity> get carouselsList => _carousels;
  List<CategoryEntity> get categoriesList => _categories;
  List<Products> get productModelList => _productModelList;
  List<Products> get favouriteProductModelList =>
      _favouriteProductModelList;
  Color get carouselBackgroundColor => _carouselBackgroundColor.value;
  RequestStatus get carouselRequestStatus => _carouselRequestStatus.value;
  RequestStatus get categoriesRequestStatus => _categoriesRequestStatus.value;
  RequestStatus get productsRequestStatus => _productsRequestStatus.value;
  int get currentCarouselIndex => _currentCarouselIndex.value;
  bool get appBarExpanded => _appBarExpanded.value;
  String get errorMessage => _errorMessage.value;

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
  set errorMessage(value) => _errorMessage.value = value;

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
      errorMessage = mapFailureToErrorMessage(l);
      customSnackbar(title: "Error", message:  errorMessage);
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

  viewProductDetails({required Products productModel, required int index}) {
    final countUpdate = productModel.count?.copyWith(favorites: 1);
    productModelList[index] = productModel.copyWith(count: countUpdate);

    Get.toNamed(Routes.details, arguments: 1);
  }
}
