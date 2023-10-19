import 'package:dartz/dartz.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';
import 'package:mobmart/app/features/product_details/data/datasources/product_data_provider.dart';
import 'package:mobmart/app/features/product_details/domain/repositories/product_details_repositories.dart';
import 'package:mobmart/core/error/exceptions.dart';
import 'package:mobmart/core/error/failures.dart';

class ProductDetailsRepositoryImpl extends ProductDetailsRepository {
  final ProductDetailsDataProvider dataProvider;

  ProductDetailsRepositoryImpl({required this.dataProvider});

  @override
  Future<Either<Failure, List<ProductModel>>> fetchRecommendations() async {
    try {
      List<ProductModel> recommendationList =
          await dataProvider.fetchRecommendations();
      return Right(recommendationList);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on ForbiddenException {
      return Left(ForbiddenFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      print(e);
      return Left(UnknownFailure());
    }
  }
}
