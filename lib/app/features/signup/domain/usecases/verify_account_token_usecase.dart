import 'package:dartz/dartz.dart';
import 'package:mobmart/app/features/signup/domain/repositories/signup_repository.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/auth/verify_token_params.dart';
import 'package:mobmart/core/usecase/usecase_builder.dart';

class VerifyAccountTokenUsecase extends UseCase<String, VerifyTokenParams> {
  final SignupRepository repository;

  VerifyAccountTokenUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(VerifyTokenParams params) async {
    return await repository.verifyToken(params: params);
  }
}
