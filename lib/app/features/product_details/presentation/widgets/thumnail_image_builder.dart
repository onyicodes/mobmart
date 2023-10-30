import 'package:flutter/material.dart';

class ThumbnailImageBuilder extends StatelessWidget {
  final List<String> imageUrlList;
  final void Function(int index) onTap;
  const ThumbnailImageBuilder(
      {super.key, required this.imageUrlList, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: imageUrlList
          .asMap()
          .map((key, value) => MapEntry(
              key,
              IconButton(
                  onPressed: () {
                    onTap(key);
                  },
                  iconSize: 30,
                  icon: Image.asset( value, height: 30, width: 30,)))).values.toList(),
    );
  }
}
