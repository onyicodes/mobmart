import 'package:flutter/material.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';
import 'package:mobmart/app/features/home/presentation/widgets/products/product_image_cover.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/custom_list_space.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  const ProductCard({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageCover(
            imageUrl: productModel.photo.first,
          ),
          CustomListSpacing(spacingValue: ListSpacingValue.spacingV8.value),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              productModel.productType,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: primaryTextTheme.displaySmall,
            ),
          ),
          CustomListSpacing(spacingValue: ListSpacingValue.spacingV8.value),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              productModel.title,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: primaryTextTheme.displaySmall,
            ),
          ),
          CustomListSpacing(spacingValue: ListSpacingValue.spacingV8.value),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.yellow,
                    ),
                    Text(
                      "${productModel.ratings} | ${productModel.totalReviews}",
                      style: primaryTextTheme.bodyLarge!
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
                Text(
                  "${productModel.price}",
                  style: primaryTextTheme.bodyLarge!
                      .copyWith(color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
