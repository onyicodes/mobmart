import 'package:mobmart/app/features/onboarding/domain/entities/onboarding_content_entity.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class OnboardContentRepository {
  Future<Either<Failure, List<OnboardContentEntity>>> fetchOnboardingContents();
}
