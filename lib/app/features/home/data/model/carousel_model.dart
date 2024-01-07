// ignore_for_file: annotate_overrides, overridden_fields

import 'package:mobmart_app/app/features/home/domain/entities/carousel_entity.dart';

class CarouselModel extends CarouselEntity {
  final String image;
  final String title;
  final String subTitle;
  final String headTag;

  const CarouselModel({
    required this.title,
    required this.subTitle,
    required this.headTag,
    required this.image,
  }) : super(image: image, title: title, subTitle: subTitle, headTag: headTag);

  factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
      image: json["image"],
      title: json["title"],
      subTitle: json["subtitle"],
      headTag: json["headTag"]);

  Map<String, dynamic> toMap() => {"title": title, "icon": image};
}
