import 'package:mobmart/app/features/signin/data/datasources/signin_datasource.dart';
import 'package:mobmart/app/features/signin/domain/entities/signin_entity.dart';
import 'package:mobmart/app/features/signin/domain/repositories/signin_repository.dart';
import 'package:mobmart/core/error/exceptions.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/auth/signin_params.dart';
import 'package:dartz/dartz.dart';

class SigninRepositoryImpl extends SigninRepository {
  final SigninDataProvider dataProvider;

  SigninRepositoryImpl({required this.dataProvider});

  @override
  Future<Either<Failure, SigninEntity>> emailSignup(
      {required SigninParams params}) async {
    try {
      SigninEntity user = await dataProvider.emailSignin(params: params);
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on AccountNotFoundException {
      return Left(AccountNotFoundFailure());
    } catch (e) {
      return  Left(UnknownFailure(message: e.toString()));
    }
  }
}
