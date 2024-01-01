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
        Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: ClipOval(
                  // <-- clips to the 200x200 [Container] below
                  child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: favourited
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(Icons.favorite_border)))),
              onPressed: updateFav,
            )),
      ],
    );
  }
}
