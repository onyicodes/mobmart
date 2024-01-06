import 'package:mobmart/app/features/auth/data/model/signin_model.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/auth/signin_params.dart';
import 'package:dartz/dartz.dart';

abstract class SigninRepository {
  Future<Either<Failure, SigninModel>> emailSignup(
      {required SigninParams params});
}
