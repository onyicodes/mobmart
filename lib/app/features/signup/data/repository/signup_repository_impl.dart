import 'package:dartz/dartz.dart';
import 'package:mobmart/app/features/signup/data/datasources/signup_datasource.dart';
import 'package:mobmart/app/features/signup/domain/repositories/signup_repository.dart';
import 'package:mobmart/core/error/exceptions.dart';
import 'package:mobmart/core/error/failures.dart';
import 'package:mobmart/core/parameters/auth/email_signup_params.dart';

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
    } on AccountNotFoundException {
      return Left(AccountNotFoundFailure());
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
