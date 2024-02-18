import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobmart_app/app/features/product_details/presentation/controllers/product_details_controller.dart';
import 'package:mobmart_app/app/features/product_details/presentation/widgets/buy_button_widget.dart';
import 'package:mobmart_app/app/features/product_details/presentation/widgets/description_builder.dart';
import 'package:mobmart_app/app/features/product_details/presentation/widgets/review_pagination_builder.dart';
import 'package:mobmart_app/app/features/product_details/presentation/widgets/about_item_builder.dart';
import 'package:mobmart_app/app/features/product_details/presentation/widgets/product_details_image_cover.dart';
import 'package:mobmart_app/app/features/product_details/presentation/widgets/seller_info_builder.dart';
import 'package:mobmart_app/app/features/product_details/presentation/widgets/shipping_info_builder%20copy.dart';
import 'package:mobmart_app/core/constants/assets_constants.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/action_icon_widget.dart';
import 'package:mobmart_app/core/general_widgets/custom_simple_loading_widget.dart';
import 'package:mobmart_app/core/general_widgets/error_handling/error_handler_widget.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
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
          actions: [
            GetX<ProductDetailsController>(
              builder: (_) {
                return _.productsRequestStatus == RequestStatus.success? Row(children: [
                  ActionButtonWidget(
                    svgImagePath: AssetsConstants.actionLikeIcon,
                    onTap: () {
                      _.favourited = !_.favourited;
                      _.displayFavouriteSplash();
                    },
                    isSelected: _.favourited,
                    showSplashOnTap: _.showFavouriteSplash,
                    splashIcon: Lottie.asset(
                        'assets/json_contents/lottie/favourite_icon.json',
                        width: 50,
                        height: 50),
                    selectedIcon: const Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                      size: 30,
                    ),
                    badgeCounter: 0),
                     Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: ActionButtonWidget(
                                svgImagePath: AssetsConstants.actionShareIcon,
                                onTap: () {},
                                badgeCounter: 0),
                          )
                    ],).animate().fadeIn(): const SizedBox.shrink();
              },
            ),
           
          ],
        ),
        body: GetX<ProductDetailsController>(
          builder: (_) {
            return _.productsRequestStatus
              == RequestStatus.success && _.productModel != null? Column(children: [
              Expanded(
                child: ListView(
                  controller: _.mainScrollController,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
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
                            imageUrlList: _.productModel!.photo,
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
                          Text(_.productModel!.business!.name)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _.productModel!.title,
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
                              Text("${_.productModel!.rating} Ratings")
                            ],
                          ),
                          Text("${_.productModel!.count?.review} Reviews"),
                          Text("${_.productModel!.count?.ordered} Sold")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                     const Tab(
                              text: "About Item",
                            ),
                    GetX<ProductDetailsController>(builder: (_) {
                      return  _.productModel!.aboutProduct != null?  AboutItemsBuilder(aboutProduct: _.productModel!.aboutProduct!):const SizedBox();
                    }),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    DescriptionBuilder(description: _.productModel!.description),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    if(_.productModel!.shippingInfo !=null)
                    ShippingInfoBuilder(
                        shippingInfo: _.productModel!.shippingInfo!),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    if(_.productModel!.business != null)
                    SellerInfoBuilder(sellerInfoModel: _.productModel!.business!, lastSeen: _.productModel!.lastSeen,),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    // ReviewsAndRatingsBuilder(
                    //     storeRatingModel: _.productModel.sellerInfor.storeRating),
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
                              const SizedBox(
                                height: 6,
                              ),
                              // Text(
                              //   'Showing 3 of ${totalReviewsFormatter(rating: _.productModel.sellerInfor.storeRating.total)} reviews',
                              //   style: primaryTextTheme.bodyMedium,
                              // ),
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
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      boxShadow: const [],
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
                                    iconSize: 25,
                                    iconDisabledColor: Colors.grey,
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    // GetX<ProductDetailsController>(builder: (_) {
                    //   return _.reviewPageNo >= 0
                    //       ? SizedBox(
                    //           height: 600,
                    //           child: PageView.builder(
                    //               controller: _.reviewPageController,
                    //               itemCount: _.reviewsNumberOfPages,
                    //               onPageChanged: (index) {
                    //                 _.reviewPageNo = index;
                    //               },
                    //               itemBuilder: (context, index) {
                    //                 return ListView.builder(
                    //                     itemCount: _.numberOfReviewsPerPage,
                    //                     physics:
                    //                         const NeverScrollableScrollPhysics(),
                    //                     shrinkWrap: true,
                    //                     itemBuilder: (context, index) {
                    //                       index = _.numberOfReviewsPerPage *
                    //                               _.reviewPageNo +
                    //                           index;
                    //                       return ReviewCard(
                    //                               review: _.productModel
                    //                                   .reviews[index])
                    //                           .animate(
                    //                               autoPlay: true,
                    //                               delay: const Duration(
                    //                                   milliseconds: 100))
                    //                         ..shimmer();
                    //                     });
                    //               }),
                    //         )
                    //       : const SizedBox.shrink();
                    // }),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: GetX<ProductDetailsController>(builder: (_) {
                            return ReviewPaginationBuilder(
                                onPageChange: (index) {
                                  _.onReviewPageChange(index: index);
                                },
                                currentPageIndex: _.reviewPageNo,
                                numberOfPages: _.reviewsNumberOfPages);
                          }),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              "See more",
                              style: primaryTextTheme.headlineMedium!.copyWith(
                                  color: Theme.of(context).primaryColorDark),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Recommendation',
                        style: primaryTextTheme.displaySmall,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: GetX<ProductDetailsController>(builder: (_) {
                    //     return _.productsRequestStatus == RequestStatus.loading ||
                    //             _.productsRequestStatus == RequestStatus.success
                    //         ? ProductGridBuilder(
                    //             productList: _.productModelList,
                    //             checkFavourited: (productModel) =>
                    //                 checkFavourited(
                    //                     productModel: productModel,
                    //                     favouriteProductList: _.homeController
                    //                         .favouriteProductModelList),
                    //             productRequestStatus: _.productsRequestStatus,
                    //             onTapProduct: (productModel) {
                    //               _.viewProductDetails(product: productModel);
                    //             })
                    //         : Container(
                    //             color: Colors.red,
                    //             height: 200,
                    //             width: 200,
                    //           );
                    //   }),
                    // ),
                  ]
                      .animate(
                          autoPlay: true,
                          delay: const Duration(milliseconds: 100))
                      .slideY(begin: 0.15, end: 0),
                ),
              ),
              Container(
                color: Theme.of(context).cardColor,
                height: 100,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "\$${_.productModel!.newPrice.toStringAsFixed(2)}",
                              style: primaryTextTheme.displayMedium!.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: BuyButtonWidget(),
                      )
                    ],
                  ),
                ),
              )
            ]):_.productsRequestStatus == RequestStatus.loading?
            const Center(child: CustomSimpleLoadingWidget(size: 40,),):
               ErrorHandlerWidget(
                          message: _.errorMessage,
                          onReload: () {
                            
                          
                          });
          }
        ),
      ),
    );
  }
}
