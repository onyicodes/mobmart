import 'package:flutter/material.dart';

class BulletTextCard extends StatelessWidget {
  final String text;
  const BulletTextCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\u2022',
                style:   primaryTextTheme.headlineLarge,
              ),
            const  SizedBox(
                width: 8,
              ),
              Expanded(
                child:  Text(
                    text,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style:  primaryTextTheme.bodyLarge!.copyWith(height: 1.4),
                  ),
              ),
            ],
          );
  }
}
