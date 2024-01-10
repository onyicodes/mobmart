import 'package:dartz/dartz.dart';
import 'package:mobmart_app/app/features/auth/domain/repositories/signin_repository.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/parameters/auth/recover_account_params.dart';
import 'package:mobmart_app/core/usecase/usecase_builder.dart';

class RecoverAccountUsecase extends UseCase<bool, RecoverAccountParams> {
  final SigninRepository repository;

  RecoverAccountUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(RecoverAccountParams params) async {
    return await repository.recoverAccount(params: params);
  }
}
