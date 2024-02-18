import 'package:flutter/material.dart';
import 'package:mobmart_app/core/models/product_models/about_product_model.dart';

class AboutItemsBuilder extends StatelessWidget {
  final AboutProduct aboutProduct;
  const AboutItemsBuilder({super.key, required this.aboutProduct});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Row(
                    children: [
                      Text(
                        "Brand:  ",
                        style: primaryTextTheme.bodyLarge,
                      ),
                      Text(
                        aboutProduct.brandName,
                        style: primaryTextTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    children: [
                      Text(
                        "Color:  ",
                        style: primaryTextTheme.bodyLarge,
                      ),
                      for(final color in aboutProduct.colors)
                        Text(color.colorCode,
                        style: primaryTextTheme.headlineMedium,
                      )
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Row(
                    children: [
                      Text(
                        "Category:  ",
                        style: primaryTextTheme.bodyLarge,
                      ),
                      Text(
                        aboutProduct.category?.name??"",
                        style: primaryTextTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    children: [
                      Text(
                        "Material:  ",
                        style: primaryTextTheme.bodyLarge,
                      ),
                      Text(
                        aboutProduct.material,
                        style: primaryTextTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Row(
                    children: [
                      Text(
                        "Condition:  ",
                        style: primaryTextTheme.bodyLarge,
                      ),
                      Text(
                        aboutProduct.condition,
                        style: primaryTextTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    children: [
                      Text(
                        "Heavy:",
                        style: primaryTextTheme.bodyLarge,
                      ),
                      Text(
                        '${aboutProduct.weight}',
                        style: primaryTextTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
