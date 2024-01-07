import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/favourites/data/datasources/favourite_data_provider.dart';
import 'package:mobmart_app/app/features/favourites/domain/repositories/favourite_repositories.dart';
import 'package:mobmart_app/app/features/home/data/model/product_model.dart';
import 'package:mobmart_app/core/error/exceptions.dart';
import 'package:mobmart_app/core/error/failures.dart';

class FavouriteRepositoryImpl extends FavouriteRepository {
  final FavouriteDataProvider dataProvider;

  FavouriteRepositoryImpl({required this.dataProvider});

  @override
  Future<Either<Failure, List<ProductModel>>> fetchFavouriteProducts() async {
    try {
      List<ProductModel> categoryEntityList =
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
