import 'package:mobmart_app/app/features/onboarding/domain/entities/onboarding_content_entity.dart';
import 'package:mobmart_app/app/features/onboarding/domain/repositories/onboard_content_repository.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/parameters/no_params.dart';
import 'package:dartz/dartz.dart';
import 'package:mobmart_app/core/usecase/usecase_builder.dart';

class OnboardContentUsecase
    extends UseCase<List<OnboardContentEntity>, NoParams> {
  final OnboardContentRepository repository;

  OnboardContentUsecase({required this.repository});

  @override
  Future<Either<Failure, List<OnboardContentEntity>>> call(
      NoParams params) async {
    return await repository.fetchOnboardingContents();
  }
}
