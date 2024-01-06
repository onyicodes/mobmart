import 'package:dartz/dartz.dart';
import 'package:mobmart/app/features/signup/data/datasources/signup_datasource.dart';
import 'package:mobmart/app/features/signup/domain/repositories/signup_repository.dart';
import 'package:mobmart/core/error/exceptions.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/auth/email_signup_params.dart';
import 'package:mobmart/core/parameters/auth/resend_verify_token_params.dart';
import 'package:mobmart/core/parameters/auth/verify_token_params.dart';

class SignupRepositoryImpl extends SignupRepository {
  final SignupDataProvider dataProvider;

  SignupRepositoryImpl({required this.dataProvider});

  @override
  Future<Either<Failure, String>> emailSignup(
      {required SignupParams params}) async {
    try {
      String token = await dataProvider.emailSignup(params: params);
      return Right(token);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on AccountExistException {
      return Left(AccountExistsFailure());
    } catch (e) {
      return  Left(UnknownFailure(message: e is String ? e.toString() : "" ));
    }
  }

  @override
  Future<Either<Failure, String>> verifyToken(
      {required VerifyTokenParams params}) async {
    try {
      String token = await dataProvider.verifyToken(params: params);
      return Right(token);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on AccountExistException {
      return Left(AccountExistsFailure());
    } catch (e) {
      return Left(UnknownFailure(message: e is String ? e.toString() : ""));
    }
  }


  @override
  Future<Either<Failure, String>> resendVerifyToken(
      {required ResendVerifyTokenParams params}) async {
    try {
      String token = await dataProvider.resendVerifyToken(params: params);
      return Right(token);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on AccountExistException {
      return Left(AccountExistsFailure());
    } catch (e) {
      return Left(UnknownFailure(message: e is String ? e.toString() : ""));
    }
  }
}
