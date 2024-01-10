import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/auth/domain/repositories/signin_repository.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/parameters/auth/reset_password_params.dart';
import 'package:mobmart_app/core/usecase/usecase_builder.dart';

class ResetPasswordUsecase extends UseCase<bool, ResetPasswordParams> {
  final SigninRepository repository;

  ResetPasswordUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(ResetPasswordParams params) async {
    return await repository.resetPassword(params: params);
  }
}
