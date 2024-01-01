import 'package:mobmart/app/features/signin/domain/entities/signin_entity.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/auth/signin_params.dart';
import 'package:dartz/dartz.dart';

abstract class SigninRepository {
  Future<Either<Failure, SigninEntity>> emailSignup(
      {required SigninParams params});
}
