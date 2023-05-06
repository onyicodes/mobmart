import 'package:get/get.dart';
import 'package:mobmart/app/features/product_details/presentation/controllers/product_details_controller.dart';

final productDetailsControllerSl = GetInstance();

class ProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    productDetailsControllerSl
        .lazyPut<ProductDetailsController>(() => ProductDetailsController());
  }
}
