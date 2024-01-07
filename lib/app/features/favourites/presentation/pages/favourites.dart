import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart' hide Trans;
import 'package:mobmart_app/app/features/favourites/presentation/controllers/favourite_controller.dart';
import 'package:mobmart_app/core/general_widgets/error_handling/error_handler_widget.dart';
import 'package:mobmart_app/core/general_widgets/products/product_grid_builder.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/util/check_favourited_products.dart';

class FavouritePage extends GetView<FavouriteController> {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: primaryTextTheme.displaySmall,
        ),
      ),
      body: GetBuilder<FavouriteController>(builder: (_) {
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetX<FavouriteController>(builder: (_) {
                return _.favProductsRequestStatus == RequestStatus.loading ||
                        _.favProductsRequestStatus == RequestStatus.success ||
                        _.favouriteProductModelList.isNotEmpty
                    ? GetBuilder<FavouriteController>(builder: (_) {
                        return ProductGridBuilder(
                            productList: _.favouriteProductModelList,
                            checkFavourited: (product) => checkFavourited(
                                productModel: product,
                                favouriteProductList:
                                    _.favouriteProductModelList),
                            updateFav: (productModel) {
                              _.updateFavouriteProduct(
                                  productModel: productModel);
                            },
                            productRequestStatus: _.favProductsRequestStatus,
                            onTapProduct: (productModel) {
                              _.viewProductDetails(productModel: productModel);
                            });
                      })
                    : ErrorHandlerWidget(
                        message: _.errorMessage,
                        onReload: () {
                          _.fetchFavouriteProducts();
                        });
              }),
            )
          ]
              .animate(autoPlay: true, delay: const Duration(milliseconds: 100))
              .slideY(begin: 0.15, end: 0),
        );
      }),
    );
  }
}
