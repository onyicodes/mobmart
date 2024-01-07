import 'package:flutter/material.dart';
import 'package:mobmart_app/app/features/home/domain/entities/category_entity.dart';
import 'package:mobmart_app/app/features/home/presentation/widgets/category_widget.dart';

class CategoryBuilderWidget extends StatelessWidget {
  final List<CategoryEntity> categoryEntityList;
  const CategoryBuilderWidget({super.key, required this.categoryEntityList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: categoryEntityList
              .map((category) => CategoryWidget(
                    image: category.icon,
                    title: category.label,
                  ))
              .toList()),
    );
  }
}
