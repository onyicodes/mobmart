


import 'package:mobmart/app/features/home/data/model/product_model.dart';

bool checkFavourited({required ProductModel productModel, required List<ProductModel> favouriteProductList}) {
    return favouriteProductList
        .any((element) => element.id == productModel.id);
  }