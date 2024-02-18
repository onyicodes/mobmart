import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/favourites/data/datasources/favourite_data_provider.dart';
import 'package:mobmart_app/app/features/favourites/domain/repositories/favourite_repositories.dart';
import 'package:mobmart_app/core/error/exceptions.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';

class FavouriteRepositoryImpl extends FavouriteRepository {
  final FavouriteDataProvider dataProvider;

  FavouriteRepositoryImpl({required this.dataProvider});

  @override
  Future<Either<Failure, List<Products>>> fetchFavouriteProducts() async {
    try {
      List<Products> categoryEntityList =
          await dataProvider.fetchFavouriteProducts();
      return Right(categoryEntityList);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on ForbiddenException {
      return Left(ForbiddenFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
