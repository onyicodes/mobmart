import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:mobmart/app/features/splash/presentation/bindings/splash_screen_binding.dart';
import 'package:mobmart/app/routes/app_pages.dart';
import 'package:mobmart/app/theme/theme.dart';
import 'package:mobmart/core/general_widgets/custom_loading_loading_indicator.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Got here");

    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      initialBinding: SplashBinding(),
      theme: MobMartAppTheme.light(),
      darkTheme: MobMartAppTheme.dark(),
      themeMode: ThemeMode.light,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      locale: context.locale,
      navigatorObservers: [FlutterSmartDialog.observer],
       builder: FlutterSmartDialog.init(
        loadingBuilder: (String msg) =>
            const CustomLoadingIndicator(loadingMessage: 'loadingMessage'),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
