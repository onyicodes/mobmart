import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/product_details/data/datasources/product_data_provider.dart';
import 'package:mobmart_app/app/features/product_details/domain/repositories/product_details_repositories.dart';
import 'package:mobmart_app/core/error/exceptions.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';
import 'package:mobmart_app/core/parameters/products/fetch_product_details_params.dart';

class ProductDetailsRepositoryImpl extends ProductDetailsRepository {
  final ProductDetailsDataProvider dataProvider;

  ProductDetailsRepositoryImpl({required this.dataProvider});

  @override
  Future<Either<Failure, List<Products>>> fetchRecommendations() async {
    try {
      List<Products> recommendationList =
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

  @override
  Future<Either<Failure, Products>> fetchProductDetails(
      {required ProductDetailsParams params}) async {
    try {
      Products productDetails =
          await dataProvider.fetchProductDetails(params: params);
      await dataProvider.cacheProductDetails(params: productDetails);
      return Right(productDetails);
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
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

  @override
  Future<Either<Failure, Products>> fetchCachedProductDetails(
      {required int productId}) async {
    try {
      Products productDetails =
          await dataProvider.fetchCachedProductDetails(productId: productId);
      return Right(productDetails);
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
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
