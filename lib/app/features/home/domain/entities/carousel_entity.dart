import 'package:equatable/equatable.dart';

class CarouselEntity extends Equatable {
  const CarouselEntity({
    required this.title,
    required this.subTitle,
    required this.headTag,
    required this.image,
  });

  final String image;
  final String title;
  final String subTitle;
  final String headTag;

  @override
  List<Object?> get props => [
        image,
      ];
}
