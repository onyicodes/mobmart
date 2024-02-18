import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobmart_app/app/features/product_details/presentation/widgets/seller_profile_online_pics.dart';
import 'package:mobmart_app/core/constants/assets_constants.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/button_widget.dart';
import 'package:mobmart_app/core/general_widgets/custom_list_space.dart';
import 'package:mobmart_app/core/models/product_models/business_model.dart';

class SellerInfoBuilder extends StatelessWidget {
  final Business sellerInfoModel;
  final DateTime? lastSeen;
  const SellerInfoBuilder({super.key, required this.sellerInfoModel, required this.lastSeen});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selling Information:  ",
            style: primaryTextTheme.displaySmall,
          ),
          CustomListSpacing(spacingValue: ListSpacingValue.spacingV16.value),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SellerProfileOnlinePics(
                  profilePics: sellerInfoModel.photo,
                  lastActiveTime: 2,
                  storeName: sellerInfoModel.name,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sellerInfoModel.name.capitalize!.replaceAll(" ", "_"),
                      style: primaryTextTheme.headlineLarge,
                    ),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV8.value),
                    Text(
                      "Active $lastSeen Min ago ",
                      style: primaryTextTheme.headlineSmall!
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV8.value),
                    CustomButton(
                      label: "Visit store",
                      height: 40,
                      width: 180,
                      radius: 8,
                      icon: SvgPicture.asset(
                        AssetsConstants.actionstoreFrontIcon,
                        color: Theme.of(context).primaryColor,
                        height: 25,
                        width: 25,
                      ),
                      onPressed: () {},
                      backgroundColor:
                          Theme.of(context).buttonTheme.colorScheme!.surface,
                      textColor:
                          Theme.of(context).buttonTheme.colorScheme!.primary,
                      borderColor:
                          Theme.of(context).buttonTheme.colorScheme!.primary,
                      textStyle: primaryTextTheme.headlineMedium!,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
