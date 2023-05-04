import 'package:dartz/dartz.dart';
import 'package:mobmart/app/features/home/data/datasources/home_data_provider.dart';
import 'package:mobmart/app/features/home/domain/repositories/home_repositories.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataProvider dataProvider;

  HomeRepositoryImpl({required this.dataProvider});

  
}
