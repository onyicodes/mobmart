import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/product_details/domain/repositories/product_details_repositories.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';
import 'package:mobmart_app/core/parameters/no_params.dart';
import 'package:mobmart_app/core/usecase/usecase_builder.dart';

class FetchRecommendationsUsecase
    extends UseCase<List<Products>, NoParams> {
  final ProductDetailsRepository repository;

  FetchRecommendationsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<Products>>> call(NoParams params) async {
    return await repository.fetchRecommendations();
  }
}
