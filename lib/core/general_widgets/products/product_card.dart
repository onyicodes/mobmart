import 'package:flutter/material.dart';
import 'package:mobmart_app/core/general_widgets/products/product_image_cover.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/custom_list_space.dart';
import 'package:mobmart_app/core/models/product_models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Products productModel;
  final bool favourite;
  final void Function()? updateFav;
  const ProductCard(
      {super.key,
      required this.productModel,
      this.updateFav,
      required this.favourite});

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
              favourited: favourite,
              updateFav: updateFav),
          CustomListSpacing(spacingValue: ListSpacingValue.spacingV8.value),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              productModel.title,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: primaryTextTheme.headlineSmall,
            ),
          ),
          CustomListSpacing(spacingValue: ListSpacingValue.spacingV8.value),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              productModel.description,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: primaryTextTheme.bodyLarge!
                  .copyWith(color: Theme.of(context).hintColor),
            ),
          ),
          CustomListSpacing(spacingValue: ListSpacingValue.spacingV8.value),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Text(
                      "${productModel.rating} | ${productModel.count?.review??0}",
                      style: primaryTextTheme.bodyMedium!
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
                Text(
                  "\$${productModel.newPrice.toStringAsFixed(2)}",
                  style: primaryTextTheme.headlineLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
