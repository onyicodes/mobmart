import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/auth/domain/repositories/signup_repository.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/parameters/auth/resend_verify_token_params.dart';
import 'package:mobmart_app/core/usecase/usecase_builder.dart';

class ResendVerifyTokenUsecase
    extends UseCase<String, ResendVerifyTokenParams> {
  final SignupRepository repository;

  ResendVerifyTokenUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(ResendVerifyTokenParams params) async {
    return await repository.resendVerifyToken(params: params);
  }
}
