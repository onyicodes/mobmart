import 'package:mobmart_app/app/features/auth/data/datasources/signin_datasource.dart';
import 'package:mobmart_app/app/features/auth/data/model/signin_model.dart';
import 'package:mobmart_app/app/features/auth/domain/repositories/signin_repository.dart';
import 'package:mobmart_app/core/error/exceptions.dart';
import 'package:mobmart_app/core/error/failures.dart';
import 'package:mobmart_app/core/parameters/auth/recover_account_params.dart';
import 'package:mobmart_app/core/parameters/auth/reset_password_params.dart';
import 'package:mobmart_app/core/parameters/auth/signin_params.dart';
import 'package:dartz/dartz.dart';

class SigninRepositoryImpl extends SigninRepository {
  final SigninDataProvider dataProvider;

  SigninRepositoryImpl({required this.dataProvider});

  @override
  Future<Either<Failure, SigninModel>> emailSignup(
      {required SigninParams params}) async {
    try {
      SigninModel user = await dataProvider.emailSignin(params: params);
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    }  on NetworkException {
      return Left(NetworkFailure());
    } on FailedLoginException {
      return Left(FailedLoginFailure());
    } on AccountNotFoundException {
      return Left(AccountNotFoundFailure());
    } on AccountNotVerifiedException {
      return Left(AccountNotVerifiedFailure());
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

   @override
  Future<Either<Failure, bool>> recoverAccount(
      {required RecoverAccountParams params}) async {
    try {
      bool accountRecovered = await dataProvider.recoverAccount(params: params);
      return Right(accountRecovered);
    } on ServerException {
      return Left(ServerFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    }  on NetworkException {
      return Left(NetworkFailure());
    } on AccountNotFoundException {
      return Left(AccountNotFoundFailure());
    }  catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

   @override
  Future<Either<Failure, bool>> resetPassword(
      {required ResetPasswordParams params}) async {
    try {
      bool accountRecovered = await dataProvider.resetPassword(params: params);
      return Right(accountRecovered);
    } on ServerException {
      return Left(ServerFailure());
    } on NotFoundException {
      return Left(TokenNotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
