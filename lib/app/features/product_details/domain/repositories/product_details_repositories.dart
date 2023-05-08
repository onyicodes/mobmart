import 'package:dartz/dartz.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';
import 'package:mobmart/core/error/failures.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, List<ProductModel>>> fetchRecommendations();
}
