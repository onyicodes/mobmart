import 'package:mobmart_app/app/features/auth/data/model/signin_model.dart';
import 'package:mobmart_app/app/features/auth/domain/repositories/signin_repository.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/parameters/auth/signin_params.dart';
import 'package:dartz/dartz.dart';
import 'package:mobmart_app/core/usecase/usecase_builder.dart';

class EmailSigninUsecase extends UseCase<SigninModel, SigninParams> {
  final SigninRepository repository;

  EmailSigninUsecase({required this.repository});

  @override
  Future<Either<Failure, SigninModel>> call(SigninParams params) async {
    return await repository.emailSignup(params: params);
  }
}
