import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/home/data/model/product_model.dart';
import 'package:mobmart_app/app/features/home/domain/entities/carousel_entity.dart';
import 'package:mobmart_app/app/features/home/domain/entities/category_entity.dart';
import 'package:mobmart_app/core/error/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CarouselEntity>>> fetchCarousel();
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories();
  Future<Either<Failure, List<ProductModel>>> fetchProducts();
}
