import 'package:mobmart_app/app/features/onboarding/data/datasources/onboard_content_local_data_source.dart';
import 'package:mobmart_app/app/features/onboarding/domain/entities/onboarding_content_entity.dart';
import 'package:mobmart_app/app/features/onboarding/domain/repositories/onboard_content_repository.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class OnboardContentRepositoryImpl extends OnboardContentRepository {
  final OnboardContentLocalDataSource api;

  OnboardContentRepositoryImpl({required this.api});

  @override
  Future<Either<Failure, List<OnboardContentEntity>>>
      fetchOnboardingContents() async {
    List<OnboardContentEntity> buyerContentList =
        await api.fetchOnboardingContents();
    return Right(buyerContentList);
  }
}
