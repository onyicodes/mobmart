import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobmart/app/features/app/presentation/pages/app.dart';
import 'package:mobmart/core/util/initialize_get.dart';
import 'package:mobmart/firebase_options.dart';
import 'package:mobmart/generated/codegen_loader.g.dart';

void main() async {
  print("started");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "mobmart",
    options: DefaultFirebaseOptions.currentPlatform);

  print("going");

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  initializeGetX();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en')],
      path:
          'assets/translations/', // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const App()));
}
