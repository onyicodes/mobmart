import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:mobmart/app/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MobMartAppTheme.light(),
      darkTheme: MobMartAppTheme.dark(),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      defaultTransition: Transition.fade,
      locale:context.locale,
    );
  }
}
