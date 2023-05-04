

import 'package:get/get.dart';
import 'package:mobmart/app/features/home/data/datasources/home_data_provider.dart';
import 'package:mobmart/app/features/home/data/repository/home_repository_impl.dart';
import 'package:mobmart/app/features/home/domain/repositories/home_repositories.dart';
import 'package:mobmart/app/features/home/presentation/controllers/home_controller.dart';

final homeControllerSl = GetInstance();

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    homeControllerSl.lazyPut<HomeController>(() => HomeController());

   homeControllerSl.lazyPut<HomeRepository>(
        () =>HomeRepositoryImpl(dataProvider: homeControllerSl()));

    homeControllerSl.lazyPut<HomeDataProvider>(() => HomeDataProviderImpl());
  }
}
