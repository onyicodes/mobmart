// ignore_for_file: annotate_overrides, overridden_fields

import 'package:mobmart_app/app/features/home/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  final String icon;
  final String label;

  const CategoryModel({required this.icon, required this.label})
      : super(icon: icon, label: label);

  factory CategoryModel.fromMap(Map<String, dynamic> json) =>
      CategoryModel(icon: json["icon"], label: json["label"]);

  Map<String, dynamic> toMap() => {"label": label, "icon": icon};
}
