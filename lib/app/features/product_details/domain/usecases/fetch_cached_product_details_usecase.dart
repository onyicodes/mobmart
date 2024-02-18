import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/product_details/domain/repositories/product_details_repositories.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';
import 'package:mobmart_app/core/usecase/usecase_builder.dart';

class FetchCachedProductDetailsUsecase
    extends UseCase<Products, int> {
  final ProductDetailsRepository repository;

  FetchCachedProductDetailsUsecase({required this.repository});

  @override
  Future<Either<Failure, Products>> call(
      int params) async {
    return await repository.fetchCachedProductDetails(productId: params);
  }
}
