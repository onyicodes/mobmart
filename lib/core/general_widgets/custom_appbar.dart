import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobmart/core/constants/assets_constants.dart';

AppBar customAppBar(
    {Key? key,
    required String title,
    bool logoTitle = false,
    double elevation = 0.3,
    double toolbarHeight = 70,
    bool automaticallyImplyLeading = true,
    bool centerTitle = false,
    bool verifiedBusiness = false,
    Color? bgColor,
    List<Widget> actions = const <Widget>[],
    required TextTheme primaryTextTheme,
    void Function()? onAppBarTap}) {
  return AppBar(
    backgroundColor: bgColor,
    title: logoTitle
        ? const SizedBox(
            height: 80,
            width: 120,
            child: Image(
              image: AssetImage(AssetsConstants.logo),
            ))
        : Text(
            title,
            style: primaryTextTheme.displaySmall,
          ),
    centerTitle: logoTitle ? true : centerTitle,
    actions: actions,
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: automaticallyImplyLeading
        ? Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: IconButton(
                onPressed: onAppBarTap ??
                    () {
                      Get.back();
                    },
                icon:const Icon(Icons.arrow_back_rounded)),
          )
        : null,
    elevation: logoTitle ? 0 : elevation,
    toolbarHeight: logoTitle ? 100 : toolbarHeight,
  );
}
