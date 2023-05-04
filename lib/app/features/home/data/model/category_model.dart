// ignore_for_file: annotate_overrides, overridden_fields

import 'package:mobmart/app/features/home/domain/entities/category_entity.dart';

class RecipeModel extends CategoryEntity {
  final String icon;
  final List label;

  const RecipeModel({required this.icon, required this.label})
      : super(icon: icon, label: label);

  factory RecipeModel.fromMap(Map<String, dynamic> json) =>
      RecipeModel(icon: json["icon"], label: json["label"]);

  Map<String, dynamic> toMap() => {"label": label, "icon": icon};
}
