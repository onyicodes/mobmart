import 'dart:ui';

import 'package:flutter/material.dart';

class ProductImageCover extends StatelessWidget {
  final String imageUrl;
  final bool favourited;
  final void Function()? updateFav;
  const ProductImageCover(
      {Key? key, required this.imageUrl,this.updateFav, required this.favourited})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: const EdgeInsets.all(2),
            height: 150,
            width: 240,
            decoration: BoxDecoration(
                color: Theme.of(context).shadowColor.withAlpha(180),
                borderRadius: const BorderRadius.all(Radius.circular(2)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imageUrl),
                ))),
      
      ],
    );
  }
}
