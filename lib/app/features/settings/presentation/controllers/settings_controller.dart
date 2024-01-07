import 'package:mobmart/app/features/onboarding/domain/entities/onboarding_content_entity.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobmart/core/util/logout_user.dart';

class SettingsController extends GetxController {
  final GetStorage storeBox;
  
  SettingsController(
      { required this.storeBox});

  final PageController pageController = PageController();

  final _accountType = ''.obs;
  final _page = 0.obs;
  final _contentList = <OnboardContentEntity>[].obs;

  get accountType => _accountType.value;
  int get page => _page.value;
  List<OnboardContentEntity> get contentList => _contentList;

  set contentList(value) => _contentList.value = value;
  set accountType(value) => _accountType.value = value;
  set page(value) => _page.value = value;
  late String lastUserId;
  @override
  void onInit() {
    super.onInit();
  }
  

  logout() async {
    logUserOut(storeBox: storeBox);
    customSnackbar(title: "Success", message: LocaleKeysSettingsTexts.logoutSuccess);
  }
}
