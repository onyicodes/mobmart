import 'package:dartz/dartz.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/parameters/auth/email_signup_params.dart';
import 'package:mobmart_app/core/parameters/auth/resend_verify_token_params.dart';
import 'package:mobmart_app/core/parameters/auth/verify_token_params.dart';

abstract class SignupRepository {
  Future<Either<Failure, String>> emailSignup({required SignupParams params});
  Future<Either<Failure, String>> verifyToken(
      {required VerifyTokenParams params});
  Future<Either<Failure, String>> resendVerifyToken(
      {required ResendVerifyTokenParams params});
}
