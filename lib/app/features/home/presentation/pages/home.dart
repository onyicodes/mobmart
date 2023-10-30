import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart' hide Trans;
import 'package:mobmart/app/features/home/presentation/controllers/home_controller.dart';
import 'package:mobmart/app/features/home/presentation/widgets/banner_loader.dart';
import 'package:mobmart/app/features/home/presentation/widgets/carousel_app_bar.dart';
import 'package:mobmart/app/features/home/presentation/widgets/category_builder_widget.dart';
import 'package:mobmart/app/features/home/presentation/widgets/products/product_grid_builder.dart';
import 'package:mobmart/app/features/home/presentation/widgets/search_app_bar_widget.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/util/check_favourited_products.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          physics: const PageScrollPhysics(),
          headerSliverBuilder: (BuildContext context,
                  bool innerBoxIsScrolled) =>
              [
                GetBuilder<HomeController>(builder: (_) {
                  return SliverOverlapAbsorber(
                    handle: SliverOverlapAbsorberHandle() ,
                    sliver: SliverSafeArea(
                        top: false,
                    sliver: SliverAppBar(
                      expandedHeight: 530.0,
                      collapsedHeight: kToolbarHeight + 20,
                      automaticallyImplyLeading: false,
                      pinned: true,
                      floating: true,
                      snap: true,
                      scrolledUnderElevation: 1,
                      centerTitle: true,
                      backgroundColor:
                          Theme.of(context).appBarTheme.backgroundColor,
                      bottom: PreferredSize(
                          preferredSize:
                              const Size(double.infinity, kToolbarHeight),
                          child: Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: const EdgeInsets.only(
                                bottom: 16.0, left: 12, right: 12, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Best Sale Product",
                                  style: primaryTextTheme.displaySmall,
                                ),
                                Text(
                                  "See more",
                                  style: primaryTextTheme.headlineMedium!
                                      .copyWith(
                                          color: Theme.of(context).primaryColor),
                                )
                              ],
                            ),
                          )),
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarIconBrightness: Theme.of(context)
                              .appBarTheme
                              .systemOverlayStyle!
                              .statusBarIconBrightness,
                          systemNavigationBarContrastEnforced: true,
                          // statusBarColor: _.appBarExpanded
                          //     ? _.carouselBackgroundColor
                          //     : Theme.of(context).appBarTheme.backgroundColor
                          ),
                      title: const SearchAppBar(
                          backgroundColor: Colors.transparent,
                          actionWidgets: []),
                      flexibleSpace: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        //collapsed height - kToolbarHeight + 20
                        //bottom height - kToolbarHeight
                        WidgetsBinding.instance.addPostFrameCallback((k) {
                          _.appBarExpanded = constraints.biggest.height !=
                              MediaQuery.of(context).padding.top +
                                  kToolbarHeight +
                                  20 +
                                  kToolbarHeight;
                  
                        });
                  
                        return FlexibleSpaceBar(
                          titlePadding: EdgeInsets.zero,
                          expandedTitleScale: 1,
                          collapseMode: CollapseMode.parallax,
                          background: GetX<HomeController>(builder: (_) {
                            return _.carouselRequestStatus ==
                                    RequestStatus.success
                                ? Column(
                                    children: [
                                      CarouselAppBar(
                                        currentIndex: _.currentCarouselIndex,
                                        onCarouselChange: ((index, reason) {
                                          _.currentCarouselIndex = index;
                                          _.carouselBackgroundColor = _
                                              .carouselPaletteColorList[index]
                                              .color;
                                        }),
                                        backgroundColor:
                                            _.carouselBackgroundColor,
                                        carouselEntityList: _.carouselsList,
                                      ),
                                      CategoryBuilderWidget(
                                          categoryEntityList: _.categoriesList)
                                    ],
                                  )
                                : _.carouselRequestStatus == RequestStatus.loading
                                    ? const BannerLoaderWidget()
                                    : Container(
                                        color: Colors.red,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width,
                                      );
                          }),
                        );
                      }),
                    ),
                  ));
                })
              ],
          body: GetBuilder<HomeController>(builder: (_) {
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GetX<HomeController>(builder: (_) {
                      return _.productsRequestStatus == RequestStatus.loading ||
                              _.productsRequestStatus == RequestStatus.success
                          ? GetBuilder<HomeController>(builder: (_) {
                              return ProductGridBuilder(
                                  productList: _.productModelList,
                                  checkFavourited: (product) => checkFavourited(
                                      productModel: product,
                                      favouriteProductList:
                                          _.favouriteProductModelList),
                                  productRequestStatus: _.productsRequestStatus,
                                  onTapProduct: (productModel) {
                                    _.viewProductDetails(
                                        productModel: productModel);
                                  });
                            })
                          : Container(
                              color: Colors.red,
                              height: 200,
                              width: 200,
                            );
                    }),
                  )
                ]
                    .animate(
                        autoPlay: true, delay: const Duration(milliseconds: 100))
                    .slideY(begin: 0.15, end: 0),
              );
            }
          )),
    );
  }
}
