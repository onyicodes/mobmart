import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/home/data/model/product_model.dart';
import 'package:mobmart_app/core/error/failures.dart';

abstract class FavouriteRepository {
  Future<Either<Failure, List<ProductModel>>> fetchFavouriteProducts();
}
