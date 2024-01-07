import 'package:flutter/material.dart';
import 'package:mobmart_app/app/features/product_details/presentation/widgets/thumnail_image_builder.dart';

class ProductDetailsImageCover extends StatelessWidget {
  final bool detailsView;
  final List<String> imageUrlList;
  final int currentImageIndex;
  final void Function(int index) onTapThumbnail;
  const ProductDetailsImageCover(
      {Key? key,
      required this.detailsView,
      required this.currentImageIndex,
      required this.onTapThumbnail,
      required this.imageUrlList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: const EdgeInsets.all(2),
            height: 400,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).shadowColor.withAlpha(180),
                borderRadius: const BorderRadius.all(Radius.circular(2)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imageUrlList[currentImageIndex]),
                ))),
        Positioned(
          left: 20,
          top: 20,
          child: ThumbnailImageBuilder(
              imageUrlList: imageUrlList, onTap: onTapThumbnail),
        ),
      ],
    );
  }
}
