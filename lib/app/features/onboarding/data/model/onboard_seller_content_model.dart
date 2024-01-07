// ignore_for_file: annotate_overrides, overridden_fields

import 'package:mobmart_app/app/features/onboarding/domain/entities/onboarding_content_entity.dart';

class OnboardContentModel extends OnboardContentEntity {
  final String title;
  final String subtitle;
  final String imageUrl;

  const OnboardContentModel(
      {required this.title, required this.subtitle, required this.imageUrl})
      : super(title: title, subtitle: subtitle, imageUrl: imageUrl);

  factory OnboardContentModel.fromJson(Map<String, dynamic> json) {
    return OnboardContentModel(
        title: json['title'] as String,
        subtitle: json['subtitle'] as String,
        imageUrl: json['imageUrl'] as String);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['subtitle'] = subtitle;
    data['title'] = title;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
