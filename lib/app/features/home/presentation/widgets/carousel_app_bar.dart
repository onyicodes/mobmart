import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:mobmart/app/features/home/domain/entities/carousel_entity.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/button_widget.dart';
import 'package:mobmart/core/general_widgets/custom_carousel_indicator_builder.dart';
import 'package:mobmart/core/general_widgets/custom_list_space.dart';
import 'package:mobmart/core/general_widgets/custom_search_field.dart';

class CarouselAppBar extends StatelessWidget {
  final Color backgroundColor;
  final int currentIndex;
  final List<CarouselEntity> carouselEntityList;
  final void Function(int index, CarouselPageChangedReason reason)
      onCarouselChange;
  const CarouselAppBar(
      {Key? key,
      required this.backgroundColor,
      required this.currentIndex,
      required this.onCarouselChange,
      required this.carouselEntityList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return FlutterCarousel(
        items: carouselEntityList
            .map(
              (e) => Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    height: 260,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      height: 260,
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image(image: AssetImage(e.image)),
                  ),
                  Positioned(
                     top: 180,
                   right: 24,
                    child: CustomCarouselIndicatorBuilder(carouselEntityList: carouselEntityList,currenIndex: currentIndex,)),
                  Positioned(
                    top: 180,
                    left: 24,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.headTag,
                            style: primaryTextTheme.headlineLarge,
                          ),
                          CustomListSpacing(
                            spacingValue: ListSpacingValue.spacingV8.value,
                          ),
                          Text(
                            e.title,
                            style: primaryTextTheme.displayMedium,
                          ),
                          CustomListSpacing(
                            spacingValue: ListSpacingValue.spacingV8.value,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              e.subTitle,
                              style: primaryTextTheme.bodyLarge,
                            ),
                          ),
                          CustomListSpacing(
                            spacingValue: ListSpacingValue.spacingV24.value,
                          ),
                          CustomButton(
                              width: 180,
                              height: 40,
                              radius: 4,
                              label: "Check this out",
                              onPressed: () {},
                              backgroundColor: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme!
                                  .onBackground,
                              borderColor: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme!
                                  .onBackground,
                              primaryTextTheme: primaryTextTheme)
                        ]),
                  ),
                ],
              ),
            )
            .toList(),
        options: CarouselOptions(
            height: 400.0,
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 6),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            onPageChanged: onCarouselChange,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            pauseAutoPlayOnTouch: true,
            pauseAutoPlayOnManualNavigate: true,
            pauseAutoPlayInFiniteScroll: false,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            disableCenter: false,
            showIndicator: false));
  }
}
