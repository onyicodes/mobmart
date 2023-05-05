import 'package:dartz/dartz.dart';
import 'package:mobmart/app/features/home/domain/entities/carousel_entity.dart';
import 'package:mobmart/app/features/home/domain/repositories/home_repositories.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/no_params.dart';
import 'package:mobmart/core/usecase/usecase_builder.dart';

class FetchCarouselUsecase extends UseCase<List<CarouselEntity>, NoParams> {
  final HomeRepository repository;

  FetchCarouselUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CarouselEntity>>> call(NoParams params) async {
    return await repository.fetchCarousel();
  }
}
