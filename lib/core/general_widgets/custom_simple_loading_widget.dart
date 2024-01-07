import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobmart_app/core/constants/assets_constants.dart';

class CustomSimpleLoadingWidget extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final bool applyIcon;
  const CustomSimpleLoadingWidget(
      {Key? key, this.size = 10, this.applyIcon = true, this.strokeWidth = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator.adaptive(
            strokeWidth: strokeWidth,
          ),
        ),
        if (!kIsWeb && Platform.isAndroid && applyIcon)
          SizedBox(
              height: size - 3,
              width: size - 3,
              child: const Image(image: AssetImage(AssetsConstants.logo)))
      ],
    );
  }
}
