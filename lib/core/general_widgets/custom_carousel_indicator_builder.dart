import 'package:flutter/material.dart';
import 'package:mobmart/core/general_widgets/carousel_indicator_widget.dart';

class CustomCarouselIndicatorBuilder extends StatelessWidget {
  final int currenIndex;
  final List carouselEntityList;
  const CustomCarouselIndicatorBuilder(
      {super.key, required this.currenIndex, required this.carouselEntityList});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: carouselEntityList.asMap().map((key, value) => MapEntry(key,  Padding(
        padding: const EdgeInsets.all(2.0),
        child: CarouselIndicatorWidget(
          selected: currenIndex ==key,
        ),
      ))).values.toList());
  }
}
