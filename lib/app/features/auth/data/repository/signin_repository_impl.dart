import 'package:mobmart/app/features/auth/data/datasources/signin_datasource.dart';
import 'package:mobmart/app/features/auth/data/model/signin_model.dart';
import 'package:mobmart/app/features/auth/domain/repositories/signin_repository.dart';
import 'package:mobmart/core/error/exceptions.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/auth/signin_params.dart';
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
    } on NetworkException {
      return Left(NetworkFailure());
    } on AccountNotFoundException {
      return Left(AccountNotFoundFailure());
    } on AccountNotVerifiedException{
      return Left(AccountNotVerifiedFailure());
    } catch (e) {
      return  Left(UnknownFailure(message: e.toString()));
    }
  }
}
