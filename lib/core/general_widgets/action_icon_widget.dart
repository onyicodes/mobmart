import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobmart/core/constants/assets_constants.dart';

class ActionButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final String svgImagePath;
  final int badgeCounter;
  const ActionButtonWidget(
      {super.key,
      required this.svgImagePath,
      required this.onTap,
      required this.badgeCounter});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          iconSize: 30,
          onPressed: onTap,
          icon: SvgPicture.asset(
            svgImagePath,
          ),
        ),
        if(badgeCounter> 0)
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            decoration: BoxDecoration(
                color: Theme.of(context).badgeTheme.backgroundColor,
                borderRadius: BorderRadius.circular(4)),
            child: Text(badgeCounterFormatter(badge: badgeCounter),
                style: Theme.of(context)
                    .badgeTheme
                    .textStyle!
                    .copyWith(color: Theme.of(context).badgeTheme.textColor)),
          ),
        )
      ],
    );
  }

 String badgeCounterFormatter({required int badge}) {
    return badge > 9 ? "9+" : badge.toString();
  }
}
