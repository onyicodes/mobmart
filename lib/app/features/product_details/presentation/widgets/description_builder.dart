import 'package:flutter/material.dart';
import 'package:mobmart/app/features/product_details/presentation/widgets/bullet_text_card.dart';

class DescriptionBuilder extends StatelessWidget {
  final String description;
  DescriptionBuilder({super.key, required this.description}) {
    descriptionBulletList = description.split("•");
  }

  late final List descriptionBulletList;

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Description: ',style: primaryTextTheme.displaySmall,),
          ),
          for (String text in descriptionBulletList ) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: BulletTextCard(text: text),
          )
        ],
      ),
    );
  }
}
