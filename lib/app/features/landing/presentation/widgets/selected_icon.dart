import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SelectedNavBar extends StatelessWidget {
  final String title;
  const SelectedNavBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title.tr,
            style: Theme.of(context)
                .primaryTextTheme
                .displaySmall!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            height: 4,
            width: 24,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.5],
                  colors: [
                    Color(0xff34F5C5),
                    Color(0xff1DCDFE),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(12))),
          )
        ],
      ),
    );
  }
}
