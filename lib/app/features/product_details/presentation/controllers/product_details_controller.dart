import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';

class ProductDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ProductDetailsController();

  late TabController tabController;

  final _imageIndexSelected = 0.obs;

  final _tabIndex = 0.obs;

  int get imageIndexSelected => _imageIndexSelected.value;
  int get tabIndex => _tabIndex.value;

  set imageIndexSelected(value) => _imageIndexSelected.value = value;
  set tabIndex(value) => _tabIndex.value = value;
  
  late ProductModel productModel;

  @override
  onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    productModel = Get.arguments;
  }

  selectImage(int index) {
    imageIndexSelected = index;
  }

  returnHome() {
    Get.back();
  }
}
