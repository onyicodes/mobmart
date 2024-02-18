import 'package:mobmart_app/core/models/product_models/product_model.dart';

bool checkFavourited(
    {required Products productModel}) {
  return productModel.count?.favorites != 0;
}
