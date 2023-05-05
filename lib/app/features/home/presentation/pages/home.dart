import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Trans;
import 'package:mobmart/app/features/home/domain/entities/carousel_entity.dart';
import 'package:mobmart/app/features/home/presentation/controllers/home_controller.dart';
import 'package:mobmart/app/features/home/presentation/widgets/carousel_app_bar.dart';
import 'package:mobmart/app/features/home/presentation/widgets/search_app_bar_widget.dart';
import 'package:mobmart/core/constants/assets_constants.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/action_icon_widget.dart';
import 'package:mobmart/core/general_widgets/custom_search_field.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return  Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
              [ GetX<HomeController>(builder: (_) {
                  return SliverAppBar(
                    expandedHeight: 375.0,
                    collapsedHeight: kToolbarHeight,
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    snap: true,
                    centerTitle: true,
                    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: _.carouselBackgroundColor ),
                    title:  SearchAppBar(backgroundColor:Colors.transparent , actionWidgets: [
                       ActionButtonWidget(svgImagePath: AssetsConstants.actionCartIcon, onTap:(){
    
                       }, badgeCounter: 1),
                       ActionButtonWidget(svgImagePath: AssetsConstants.actionReviewIcon, onTap:(){
    
                       }, badgeCounter: 10)
                    ]),
                    flexibleSpace: FlexibleSpaceBar(
                        titlePadding: EdgeInsets.zero,
                        expandedTitleScale: 1,
                        collapseMode: CollapseMode.parallax,
                        background:  GetX<HomeController>(builder: (_) {
                    return _.carouselRequestStatus == RequestStatus.success
                        ? CarouselAppBar(
                            onCarouselChange: ((index, reason) {
                              _.carouselBackgroundColor =
                                  _.carouselPaletteColorList[index].color;
                            }),
                            backgroundColor: _.carouselBackgroundColor,
                            carouselEntityList: _.carouselsList,
                          )
                        : _.carouselRequestStatus == RequestStatus.loading
                            ? CircularProgressIndicator()
                            : Container(
                                color: Colors.red,
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                              );
                  })),
                  );
                }
              )
          ],
          body: Container()),
    );
    // Container(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height,
    //     decoration:
    //         BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         GetX<HomeController>(builder: (_) {
    //           return _.carouselRequestStatus == RequestStatus.success
    //               ? CarouselAppBar(
    //                   onCarouselChange: ((index, reason) {
    //                     _.carouselBackgroundColor =
    //                         _.carouselPaletteColorList[index].color;
    //                   }),
    //                   backgroundColor: _.carouselBackgroundColor,
    //                   carouselEntityList: _.carouselsList,
    //                 )
    //               : _.carouselRequestStatus == RequestStatus.loading
    //                   ? CircularProgressIndicator()
    //                   : Container(
    //                       color: Colors.red,
    //                       height: MediaQuery.of(context).size.height,
    //                       width: MediaQuery.of(context).size.width,
    //                     );
    //         })
    //       ],
    //     )
    //     );
  }
}
