import 'package:mobmart_app/app/features/auth/data/model/signin_model.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/parameters/auth/recover_account_params.dart';
import 'package:mobmart_app/core/parameters/auth/reset_password_params.dart';
import 'package:mobmart_app/core/parameters/auth/signin_params.dart';
import 'package:dartz/dartz.dart';

abstract class SigninRepository {
  Future<Either<Failure, SigninModel>> emailSignup(
      {required SigninParams params});
  Future<Either<Failure, bool>> recoverAccount(
      {required RecoverAccountParams params});

  Future<Either<Failure, bool>> resetPassword(
      {required ResetPasswordParams params});
}
