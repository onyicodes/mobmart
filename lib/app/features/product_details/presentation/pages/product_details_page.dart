import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobmart/app/features/product_details/presentation/controllers/product_details_controller.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/reviews_and_rating_bar_builder.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/reviews_card.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/about_item_builder.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/product_details_image_cover.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/seller_info_builder.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/shipping_info_builder%20copy.dart';
import 'package:mobmart/core/constants/assets_constants.dart';
import 'package:mobmart/core/general_widgets/action_icon_widget.dart';

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
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          SvgPicture.asset( AssetsConstants.actionstoreFrontIcon, height: 25, width: 25,),
                         const  SizedBox(width: 8,),
                          Text(_.productModel.storeName)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_.productModel.title, style: primaryTextTheme.displayMedium,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                            const  Icon(Icons.star_rounded, color: Colors.amber,),
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
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Description'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        """When can I visit?: May 1 - October 29
                  Experience Lake Geneva, Wisconsin’s Original Drive-Through Safari!
                  Experience Safari Lake Geneva’s wildlife from the comfort of your own vehicle! Enhance your interaction with these amazing animals by purchasing a bowl of grain to feed them from your window or sunroof. Plus, you can drive through as many times as you like — because the animals are free to choose where they wish to be, every time through is a unique adventure. Bring the whole family or enjoy a solo trip cruising our safari drive-through and encounter some of the world’s most spectacular wild safari animals. There’s nothing like watching a giraffe stretch their neck out to munch on some tree leaves or seeing just how fast an ostrich can run. Experience this unique adventure near Chicagoland and you’ll soon discover why this is the place in Lake Geneva, Wisconsin everyone is talking about!""",
                        style: primaryTextTheme.bodyLarge,
                      ),
                    ),

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
                    Text(
                      'Top Reviews',
                      style: primaryTextTheme.displaySmall,
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
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total Price",
                          style: primaryTextTheme.bodyMedium!
                              .copyWith(color: Theme.of(context).hintColor),
                        ),
                        Text(
                          "\$${_.productModel.price}",
                          style: primaryTextTheme.displayMedium!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
