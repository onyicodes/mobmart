import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobmart/app/features/product_details/presentation/controllers/product_details_controller.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/buy_button_widget.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/description_builder.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/reviews_and_rating_bar_builder.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/reviews_card.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/about_item_builder.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/product_details_image_cover.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/seller_info_builder.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/shipping_info_builder%20copy.dart';
import 'package:mobmart/core/constants/assets_constants.dart';
import 'package:mobmart/core/general_widgets/action_icon_widget.dart';
import 'package:mobmart/core/util/total_reviews_formatter.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: GetBuilder<ProductDetailsController>(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Theme.of(context)
                    .appBarTheme
                    .systemOverlayStyle!
                    .statusBarIconBrightness,
                systemNavigationBarContrastEnforced: true,
                statusBarColor: Theme.of(context)
                    .appBarTheme
                    .systemOverlayStyle!
                    .statusBarColor),
            actions: [
              ActionButtonWidget(
                  svgImagePath: AssetsConstants.actionLikeIcon,
                  onTap: () {},
                  badgeCounter: 0),
              ActionButtonWidget(
                  svgImagePath: AssetsConstants.actionShareIcon,
                  onTap: () {},
                  badgeCounter: 0),
              ActionButtonWidget(
                  svgImagePath: AssetsConstants.actionCartIcon,
                  onTap: () {},
                  badgeCounter: 3),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    GetX<ProductDetailsController>(builder: (_) {
                      return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ProductDetailsImageCover(
                            onTapThumbnail: (index) {
                              _.selectImage(index);
                            },
                            detailsView: true,
                            currentImageIndex: _.imageIndexSelected,
                            imageUrlList: _.productModel.photo,
                          ));
                    }),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssetsConstants.actionstoreFrontIcon,
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(_.productModel.storeName)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _.productModel.title,
                        style: primaryTextTheme.displayMedium,
                      ),
                    ),
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
                              ),
                              Text("${_.productModel.ratings} Ratings")
                            ],
                          ),
                          Text("${_.productModel.totalReviews} Reviews"),
                          Text("${_.productModel.amountSold} Sold")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TabBar(
                          controller: _.tabController,
                          onTap: (index) {
                            _.tabIndex = index;
                          },
                          tabs: [
                            Tab(
                              text: "About Item",
                            ),
                            Tab(
                              text: "Reviews",
                            )
                          ]),
                    ),
                    GetX<ProductDetailsController>(builder: (_) {
                      return Visibility(
                        visible: _.tabIndex == 0,
                        replacement: Text("Reviews"),
                        child: AboutItemsBuilder(productModel: _.productModel),
                      );
                    }),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    DescriptionBuilder(description: _.productModel.description),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    ShippingInfoBuilder(
                        shippingInfo: _.productModel.shippingInfo),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    SellerInfoBuilder(
                        sellerInfoModel: _.productModel.sellerInfor),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    ReviewsAndRatingsBuilder(
                        storeRatingModel:
                            _.productModel.sellerInfor.storeRating),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Top Reviews',
                                style: primaryTextTheme.displaySmall,
                              ),
                             const SizedBox(height: 6,),
                              Text(
                                'Showing 3 of ${totalReviewsFormatter(rating: _.productModel.sellerInfor.storeRating.total)} reviews',
                                style: primaryTextTheme.bodyMedium,
                              ),
                            ],
                          ),
                          
                          GetX<ProductDetailsController>(
                            builder: (_) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                    
                                    value: _.selectedReviewOrder,
                                    
                                    items: _.reviewOrder
                                        .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(item),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      _.selectedReviewOrder = value;
                                    },
                                    buttonStyleData: ButtonStyleData(
                                        height: 45,
                                        width: 140,
                                        padding: const EdgeInsets.only(left: 14, right: 14),
                                        decoration: BoxDecoration(
                                          boxShadow: [],
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Theme.of(context).dividerColor,
                                          ),
                                          color: Theme.of(context).canvasColor,
                                        ),
                                        elevation: 2,
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                        ),
                                        iconSize:25,
                                        iconDisabledColor: Colors.grey,
                                      ),
                                    ),
                                    
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _.productModel.reviews.length,
                        itemBuilder: (context, index) {
                          return ReviewCard(
                              review: _.productModel.reviews[index]);
                        }),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).cardColor,
                height: 100,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Price",
                              style: primaryTextTheme.bodyMedium!
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                           const SizedBox(height: 8,),
                            Text(
                              "\$${_.productModel.price.toStringAsFixed(2)}",
                              style: primaryTextTheme.displayMedium!.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                
                     const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: BuyButtonWidget(),
                      )
                
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
