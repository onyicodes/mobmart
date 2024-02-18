import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/home/domain/entities/carousel_entity.dart';
import 'package:mobmart_app/app/features/home/domain/entities/category_entity.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CarouselEntity>>> fetchCarousel();
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories();
  Future<Either<Failure, List<Products>>> fetchProducts();
}
