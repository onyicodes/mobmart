import 'package:dartz/dartz.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';
import 'package:mobmart/app/features/product_details/domain/repositories/product_details_repositories.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/no_params.dart';
import 'package:mobmart/core/usecase/usecase_builder.dart';

class FetchRecommendationsUsecase
    extends UseCase<List<ProductModel>, NoParams> {
  final ProductDetailsRepository repository;

  FetchRecommendationsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) async {
    return await repository.fetchRecommendations();
  }
}
