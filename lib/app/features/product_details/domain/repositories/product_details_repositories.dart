import 'package:dartz/dartz.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';
import 'package:mobmart_app/core/parameters/products/fetch_product_details_params.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, List<Products>>> fetchRecommendations();
  Future<Either<Failure, Products>> fetchProductDetails(
      {required ProductDetailsParams params});
  Future<Either<Failure, Products>> fetchCachedProductDetails(
      {required int productId});
}
