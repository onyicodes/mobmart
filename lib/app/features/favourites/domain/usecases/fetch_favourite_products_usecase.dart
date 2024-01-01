import 'package:dartz/dartz.dart';
import 'package:mobmart/app/features/favourites/domain/repositories/favourite_repositories.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/no_params.dart';
import 'package:mobmart/core/usecase/usecase_builder.dart';

class FetchFavouriteProductsUsecase
    extends UseCase<List<ProductModel>, NoParams> {
  final FavouriteRepository repository;

  FetchFavouriteProductsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) async {
    return await repository.fetchFavouriteProducts();
  }
}