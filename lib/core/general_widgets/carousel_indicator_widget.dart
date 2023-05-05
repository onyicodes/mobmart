import 'package:flutter/material.dart';

class CarouselIndicatorWidget extends StatelessWidget {
  final bool selected;
  const CarouselIndicatorWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: selected? 12:2,
      height: 2,
      decoration:const BoxDecoration(color:Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(4))),
    );
  }
}
