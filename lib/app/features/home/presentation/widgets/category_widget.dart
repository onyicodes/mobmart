import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String title;
  const CategoryWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius:const  BorderRadius.all(Radius.circular(8)),
              color: Theme.of(context).highlightColor),
          child: Image.asset(image),
        ),
       const SizedBox(height:4),
        Text(title, style: primaryTextTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor) ,)
      ],
    );
  }
}
