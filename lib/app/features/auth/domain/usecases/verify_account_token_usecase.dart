import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/auth/domain/repositories/signup_repository.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/parameters/auth/verify_token_params.dart';
import 'package:mobmart_app/core/usecase/usecase_builder.dart';

class VerifyAccountTokenUsecase extends UseCase<String, VerifyTokenParams> {
  final SignupRepository repository;

  VerifyAccountTokenUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(VerifyTokenParams params) async {
    return await repository.verifyToken(params: params);
  }
}
