import 'package:flutter/material.dart';
import 'package:mobmart/app/features/home/data/model/product_model.dart';

class AboutItemsBuilder extends StatelessWidget {
  final ProductModel productModel;
  const AboutItemsBuilder({super.key, required this.productModel});

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
                    children: [Text("Brand:  ", style: primaryTextTheme.bodyLarge,), Text(productModel.brand, style: primaryTextTheme.headlineMedium,)],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    children: [Text("Color:  ", style: primaryTextTheme.bodyLarge,), Text(productModel.color, style: primaryTextTheme.headlineMedium,)],
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
                    children: [Text("Category:  ", style: primaryTextTheme.bodyLarge,), Text(productModel.category, style: primaryTextTheme.headlineMedium,)],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    children: [Text("Material:  ", style: primaryTextTheme.bodyLarge,), Text(productModel.material, style: primaryTextTheme.headlineMedium,)],
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
                      Text("Condition:  ", style: primaryTextTheme.bodyLarge,),
                      Text(productModel.condition, style: primaryTextTheme.headlineMedium,)
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    children: [Text("Heavy:",style: primaryTextTheme.bodyLarge,), Text(productModel.heavy, style: primaryTextTheme.headlineMedium,)],
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
