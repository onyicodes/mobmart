import 'package:flutter/material.dart';

class ProductDetailsImageCover extends StatelessWidget {
  final bool detailsView;
  final String imageUrl;
  const ProductDetailsImageCover(
      {Key? key, required this.detailsView, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: detailsView ? MediaQuery.of(context).size.width : 150,
          width:  detailsView ? 400 : 220,
          child: Image.asset(imageUrl),
        ),
        Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            )),
      ],
    );
  }
}
