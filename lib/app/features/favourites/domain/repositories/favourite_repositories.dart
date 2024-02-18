import 'package:dartz/dartz.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';

abstract class FavouriteRepository {
  Future<Either<Failure, List<Products>>> fetchFavouriteProducts();
}
