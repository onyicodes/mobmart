import 'package:flutter/material.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';
import 'package:mobmart/app/features/home/presentation/widgets/products/product_card.dart';
import 'package:mobmart/app/features/home/presentation/widgets/products/product_shimmer_loading_card.dart';
import 'package:mobmart/core/constants/general_constants.dart';

class ProductGridBuilder extends StatelessWidget {
  final List<ProductModel> productList;
  final RequestStatus productRequestStatus;
  final bool isSeller;
  final bool Function(ProductModel productModel) checkFavourited;
  final void Function(ProductModel productModel) onTapProduct;
  const ProductGridBuilder(
      {super.key,
      required this.productList,
      this.isSeller = false,
      required this.checkFavourited,
      required this.productRequestStatus,
      required this.onTapProduct});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 340.0,
        mainAxisExtent: 275,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 1.0,
      ),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: productRequestStatus == RequestStatus.success
          ? productList.length
          : productRequestStatus == RequestStatus.loading
              ? 10
              : 0,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              onTapProduct(productList[index]);
            },
            child: productRequestStatus == RequestStatus.success
                ? ProductCard(
                   favourite: checkFavourited(productList[index]),
                    productModel: productList[index],
                  )
                : productRequestStatus == RequestStatus.loading
                    ? const ProductShimmerLoadingCard()
                    : const SizedBox.shrink());
      },
    );
  }
}
