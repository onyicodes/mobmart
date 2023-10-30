import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart' hide Trans;
import 'package:mobmart/app/features/favourites/presentation/controllers/favourite_controller.dart';
import 'package:mobmart/app/features/home/presentation/widgets/products/product_grid_builder.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/util/check_favourited_products.dart';

class FavouritePage extends GetView<FavouriteController> {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      body: GetBuilder<FavouriteController>(builder: (_) {
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Text('Favourites', style: primaryTextTheme.displaySmall,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GetX<FavouriteController>(builder: (_) {
                      return _.favProductsRequestStatus == RequestStatus.loading ||
                              _.favProductsRequestStatus == RequestStatus.success
                          ? GetBuilder<FavouriteController>(builder: (_) {
                              return ProductGridBuilder(
                                  productList: _.favouriteProductModelList,
                                  checkFavourited: (product) => checkFavourited(
                                      productModel: product,
                                      favouriteProductList:
                                          _.favouriteProductModelList),
                                  productRequestStatus: _.favProductsRequestStatus,
                                  onTapProduct: (productModel) {
                                    _.viewProductDetails(
                                        productModel: productModel);
                                  });
                            })
                          : Container(
                              color: Colors.red,
                              height: 200,
                              width: 200,
                            );
                    }),
                  )
                ]
                    .animate(
                        autoPlay: true, delay: const Duration(milliseconds: 100))
                    .slideY(begin: 0.15, end: 0),
              );
            }
          ),
    );
  }
}
