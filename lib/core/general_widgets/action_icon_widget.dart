
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final String svgImagePath;
  final int badgeCounter;
  final Widget? selectedIcon;
  final bool? isSelected;
  final bool? showSplashOnTap;
  final Widget? splashIcon;
  const ActionButtonWidget(
      {super.key,
      required this.svgImagePath,
      required this.onTap,
      this.isSelected,
      this.selectedIcon, 
      this.splashIcon,
      this.showSplashOnTap,
      required this.badgeCounter});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        
        IconButton(
          iconSize: 25,
          onPressed: onTap,
          icon:(isSelected == null || !isSelected!) || selectedIcon==null? SvgPicture.asset(
            svgImagePath,
          ) : selectedIcon!,
          selectedIcon: selectedIcon,
          isSelected: isSelected,
        ),
        
        if (showSplashOnTap != null && showSplashOnTap! && splashIcon != null)
        splashIcon!,
        
          if (badgeCounter > 0)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(
                    color: Theme.of(context).badgeTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(badgeCounterFormatter(badge: badgeCounter),
                    style: Theme.of(context).badgeTheme.textStyle!.copyWith(
                        color: Theme.of(context).badgeTheme.textColor)),
              ),
            )
      ],
    );
  }

  String badgeCounterFormatter({required int badge}) {
    return badge > 9 ? "9+" : badge.toString();
  }
}
