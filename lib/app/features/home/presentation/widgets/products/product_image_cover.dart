import 'package:flutter/material.dart';

class ProductImageCover extends StatelessWidget {
  final String imageUrl;
  const ProductImageCover(
      {Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Container(
          padding:const  EdgeInsets.all(2),
          height: 150,
          width: 240,
          decoration: BoxDecoration(
              color: Theme.of(context).shadowColor.withAlpha(180),
             
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image:AssetImage( imageUrl),
              ))),
       
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
