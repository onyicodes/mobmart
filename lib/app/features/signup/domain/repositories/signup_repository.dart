import 'package:dartz/dartz.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/auth/email_signup_params.dart';

abstract class SignupRepository {
  Future<Either<Failure, String>> emailSignup({required SignupParams params});
}
