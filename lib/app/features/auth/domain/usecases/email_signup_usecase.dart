import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/auth/domain/repositories/signup_repository.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/parameters/auth/email_signup_params.dart';
import 'package:mobmart_app/core/usecase/usecase_builder.dart';

class EmailSignupUsecase extends UseCase<String, SignupParams> {
  final SignupRepository repository;

  EmailSignupUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SignupParams params) async {
    return await repository.emailSignup(params: params);
  }
}
