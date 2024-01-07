import 'package:get/get.dart';
import 'package:mobmart_app/app/features/favourites/data/datasources/favourite_data_provider.dart';
import 'package:mobmart_app/app/features/favourites/data/repository/favourite_repository_impl.dart';
import 'package:mobmart_app/app/features/favourites/domain/repositories/favourite_repositories.dart';
import 'package:mobmart_app/app/features/favourites/domain/usecases/fetch_favourite_products_usecase.dart';
import 'package:mobmart_app/app/features/favourites/presentation/controllers/favourite_controller.dart';

final favouriteControllerSl = GetInstance();

class FavouriteBinding implements Bindings {
  @override
  void dependencies() {
    favouriteControllerSl
        .lazyPut<FavouriteController>(() => FavouriteController(
              fetchFavouriteProductsUsecase: favouriteControllerSl(),
            ));

    favouriteControllerSl.lazyPut<FetchFavouriteProductsUsecase>(() =>
        FetchFavouriteProductsUsecase(repository: favouriteControllerSl()));

    favouriteControllerSl.lazyPut<FavouriteRepository>(
        () => FavouriteRepositoryImpl(dataProvider: favouriteControllerSl()));

    favouriteControllerSl.lazyPut<FavouriteDataProvider>(
        () => FavouriteDataProviderImpl(firebaseDb: favouriteControllerSl()));
  }
}
