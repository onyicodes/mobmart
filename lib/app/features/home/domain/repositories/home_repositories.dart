

import 'package:dartz/dartz.dart';
import 'package:mobmart/app/features/home/domain/entities/carousel_entity.dart';
import 'package:mobmart/app/features/home/domain/entities/category_entity.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/no_params.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CarouselEntity>>> fetchCarousel();
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories();
}
