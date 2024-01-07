import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobmart_app/core/constants/assets_constants.dart';

Future<dynamic> customSnackbar(
    {required String title,
    required String message,
    int duration = 3,
    bool isError = false,
    Widget? icon,
    void Function(GetSnackBar snackBar)? onTap,
    SnackPosition snackPosition = SnackPosition.TOP,
    Color overlayColor = Colors.white}) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar(title, message,
        icon: icon ??
            (isError
                ? Image.asset(
                    AssetsConstants.unknownErrorImage,
                    width: 100,
                  )
                : Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(AssetsConstants.logo),
                  )),
        onTap: onTap,
        duration: Duration(seconds: duration),
        backgroundColor: isError ? Colors.red.shade100 : null,
        snackPosition: snackPosition);
  }
  return Future.delayed(Duration(seconds: duration));
}
