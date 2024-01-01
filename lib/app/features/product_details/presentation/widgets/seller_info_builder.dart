import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobmart/app/features/home/data/model/seller_info_model.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/seller_profile_online_pics.dart';
import 'package:mobmart/core/constants/assets_constants.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/button_widget.dart';
import 'package:mobmart/core/general_widgets/custom_list_space.dart';

class SellerInfoBuilder extends StatelessWidget {
  final SellerInforModel sellerInfoModel;
  const SellerInfoBuilder({super.key, required this.sellerInfoModel});

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
          CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV16.value),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SellerProfileOnlinePics(
                  profilePics: sellerInfoModel.image,
                  lastActiveTime: sellerInfoModel.lastActive,
                  storeName: sellerInfoModel.storeName,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sellerInfoModel.storeName.capitalize!.replaceAll(" ", "_"),
                      style: primaryTextTheme.headlineLarge,
                    ),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV8.value),
                    Text(
                      "Active ${sellerInfoModel.lastActive} Min ago  |  ${sellerInfoModel.storeRating.positiveReviews}% Positive Feedback",
                      style: primaryTextTheme.headlineSmall!.copyWith(color: Theme.of(context).hintColor),
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
