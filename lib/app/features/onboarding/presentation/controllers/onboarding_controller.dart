import 'package:mobmart/app/features/onboarding/domain/entities/onboarding_content_entity.dart';
import 'package:mobmart/app/features/onboarding/domain/usecases/onboard_buyer_content_usecase.dart';
import 'package:mobmart/app/routes/app_pages.dart';
import 'package:mobmart/core/keys/cache_keys.dart';
import 'package:mobmart/core/parameters/no_params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  final OnboardContentUsecase onboardingContent;
  final GetStorage storeBox;

  OnboardingController(
      {required this.onboardingContent, required this.storeBox});

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

  @override
  void onInit() {
    super.onInit();
    getOnboardingContents();
  }

  getOnboardingContents() async {
    final buyerData = await onboardingContent(NoParams());
    buyerData.fold((l) => Get.snackbar('Oops!', 'An error occurred'), (r) {
      contentList = r;
    });
  }

  toSignupPage() async {
    await storeBox.write(CacheKeys.hasOnboarded, true);
    Get.offAndToNamed(Routes.signin);
  }
}
