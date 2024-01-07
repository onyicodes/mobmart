import 'package:mobmart_app/app/features/settings/presentation/controllers/settings_controller.dart';
import 'package:mobmart_app/core/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:mobmart_app/core/general_widgets/custom_appbar.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
        appBar: customAppBar(
            title: "Profile",
            primaryTextTheme: primaryTextTheme,
            actions: [
              GetBuilder<SettingsController>(builder: (_) {
                return IconButton(
                    onPressed: () {
                      _.logout();
                    },
                    icon: const Icon(Icons.logout_outlined));
              })
            ]),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsConstants.appBg),
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}
