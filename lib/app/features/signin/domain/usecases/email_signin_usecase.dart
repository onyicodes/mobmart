import 'package:mobmart/app/features/signin/domain/entities/signin_entity.dart';
import 'package:mobmart/app/features/signin/domain/repositories/signin_repository.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/auth/signin_params.dart';
import 'package:dartz/dartz.dart';
import 'package:mobmart/core/usecase/usecase_builder.dart';

class EmailSigninUsecase extends UseCase<SigninEntity, SigninParams> {
  final SigninRepository repository;

  EmailSigninUsecase({required this.repository});

  @override
  Future<Either<Failure, SigninEntity>> call(SigninParams params) async {
    return await repository.emailSignup(params: params);
  }
}
