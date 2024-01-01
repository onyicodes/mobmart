import 'package:equatable/equatable.dart';

class OnboardContentEntity extends Equatable {
  final String title;
  final String subtitle;
  final String imageUrl;

  const OnboardContentEntity(
      {required this.title, required this.subtitle, required this.imageUrl});
      
        @override
        List<Object?> get props => [title,subtitle, imageUrl];
}
