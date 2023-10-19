import 'package:flutter/material.dart';
import 'package:mobmart/app/features/home/data/model/shipping_model.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/custom_list_space.dart';

class ShippingInfoBuilder extends StatelessWidget {
  final ShippingInfoModel shippingInfo;
  const ShippingInfoBuilder({super.key, required this.shippingInfo});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shipping Information:  ",
            style: primaryTextTheme.displaySmall,
          ),
          CustomListSpacing(spacingValue: ListSpacingValue.spacingV12.value),
          Row(
            children: [
              Text(
                "Delivery:  ",
                style: primaryTextTheme.bodyLarge,
              ),
              Text(
                shippingInfo.delivery,
                style: primaryTextTheme.headlineMedium,
              )
            ],
          ),
          CustomListSpacing(spacingValue: ListSpacingValue.spacingV8.value),
          Row(
            children: [
              Text(
                "Shipping:  ",
                style: primaryTextTheme.bodyLarge,
              ),
              Text(
                shippingInfo.shipping,
                style: primaryTextTheme.headlineMedium,
              )
            ],
          ),
           CustomListSpacing(spacingValue: ListSpacingValue.spacingV8.value),

          Row(
            children: [
              Text(
                "Arrives:  ",
                style: primaryTextTheme.bodyLarge,
              ),
              Text(
                shippingInfo.arrive,
                style: primaryTextTheme.headlineMedium,
              )
            ],
          ),
        ],
      ),
    );
  }
}
