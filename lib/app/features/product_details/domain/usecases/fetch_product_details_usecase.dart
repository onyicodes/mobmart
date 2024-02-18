import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/product_details/domain/repositories/product_details_repositories.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';
import 'package:mobmart_app/core/parameters/products/fetch_product_details_params.dart';
import 'package:mobmart_app/core/usecase/usecase_builder.dart';

class FetchProductDetailsUsecase
    extends UseCase<Products, ProductDetailsParams> {
  final ProductDetailsRepository repository;

  FetchProductDetailsUsecase({required this.repository});

  @override
  Future<Either<Failure, Products>> call(
      ProductDetailsParams params) async {
    return await repository.fetchProductDetails(params: params);
  }
}
