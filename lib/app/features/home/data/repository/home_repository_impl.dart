import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/home/data/datasources/home_data_provider.dart';
import 'package:mobmart_app/app/features/home/domain/entities/carousel_entity.dart';
import 'package:mobmart_app/app/features/home/domain/entities/category_entity.dart';
import 'package:mobmart_app/app/features/home/domain/repositories/home_repositories.dart';
import 'package:mobmart_app/core/error/exceptions.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataProvider dataProvider;

  HomeRepositoryImpl({required this.dataProvider});

  @override
  Future<Either<Failure, List<CarouselEntity>>> fetchCarousel() async {
    try {
      List<CarouselEntity> carouselEntityList =
          await dataProvider.fetchCarousel();
      return Right(carouselEntityList);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on ForbiddenException {
      return Left(ForbiddenFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on NotAuthorizedException {
      return Left(NotAuthorizedFailure());
    } catch (e) {
      print(e);
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories() async {
    try {
      List<CategoryEntity> categoryEntityList =
          await dataProvider.fetchCategories();
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

  @override
  Future<Either<Failure, List<Products>>> fetchProducts() async {
    try {
      List<Products> categoryEntityList =
          await dataProvider.fetchProducts();
      return Right(categoryEntityList);
    } on ServerException {
      return Left(ServerFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on NotAuthorizedException {
      return Left(NotAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
