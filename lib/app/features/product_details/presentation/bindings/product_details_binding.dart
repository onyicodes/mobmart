import 'package:get/get.dart';
import 'package:mobmart_app/app/features/product_details/data/datasources/product_data_provider.dart';
import 'package:mobmart_app/app/features/product_details/data/repository/product_details_repository_impl.dart';
import 'package:mobmart_app/app/features/product_details/domain/repositories/product_details_repositories.dart';
import 'package:mobmart_app/app/features/product_details/domain/usecases/fetch_products_usecase.dart';
import 'package:mobmart_app/app/features/product_details/presentation/controllers/product_details_controller.dart';

final productDetailsControllerSl = GetInstance();

class ProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    productDetailsControllerSl.lazyPut<ProductDetailsController>(() =>
        ProductDetailsController(
            fetchRecommendationsUsecase: productDetailsControllerSl()));

    productDetailsControllerSl.lazyPut<FetchRecommendationsUsecase>(() =>
        FetchRecommendationsUsecase(repository: productDetailsControllerSl()));

    productDetailsControllerSl.lazyPut<ProductDetailsRepository>(() =>
        ProductDetailsRepositoryImpl(
            dataProvider: productDetailsControllerSl()));

    productDetailsControllerSl.lazyPut<ProductDetailsDataProvider>(
        () => ProductDetailsDataProviderImpl());
  }
}
