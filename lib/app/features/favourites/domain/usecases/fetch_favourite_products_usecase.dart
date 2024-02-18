import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/favourites/domain/repositories/favourite_repositories.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';
import 'package:mobmart_app/core/parameters/no_params.dart';
import 'package:mobmart_app/core/usecase/usecase_builder.dart';

class FetchFavouriteProductsUsecase
    extends UseCase<List<Products>, NoParams> {
  final FavouriteRepository repository;

  FetchFavouriteProductsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<Products>>> call(NoParams params) async {
    return await repository.fetchFavouriteProducts();
  }
}
