import 'package:flutter/material.dart';

class CustomListSpacing extends StatelessWidget {
  final double spacingValue;
  const CustomListSpacing({Key? key, required this.spacingValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:spacingValue,
    );
  }
}
