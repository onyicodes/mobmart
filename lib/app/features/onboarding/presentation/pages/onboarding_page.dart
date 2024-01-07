import 'package:easy_localization/easy_localization.dart';
import 'package:mobmart_app/app/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:mobmart_app/app/features/onboarding/presentation/widgets/onboarding_display_widget.dart';
import 'package:mobmart_app/app/features/onboarding/presentation/widgets/radio_builder.dart';
import 'package:mobmart_app/core/constants/assets_constants.dart';
import 'package:mobmart_app/core/general_widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:mobmart_app/generated/locale_keys.g.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsConstants.appBg),
          fit: BoxFit.fill,
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          GetX<OnboardingController>(
            builder: (_) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView(
                  controller: _.pageController,
                  physics: const PageScrollPhysics(),
                  scrollBehavior: const ScrollBehavior(),
                  onPageChanged: ((value) {
                    _.page = value;
                  }),
                  children: _.contentList
                      .asMap()
                      .entries
                      .map((entry) => OnboardingDisplayWidget(
                          content: entry.value,
                          pageIndex: _.page,
                          onTapBack: () => {
                                _.pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn)
                              },
                          rightSided: entry.key % 2 != 0))
                      .toList(),
                ),
              );
            },
          ),
          GetX<OnboardingController>(
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RadioBuilder(selected: 0 == _.page),
                    RadioBuilder(selected: 1 == _.page),
                    RadioBuilder(selected: 2 == _.page),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          GetBuilder<OnboardingController>(builder: (_) {
            return Align(
              alignment: Alignment.center,
              child: CustomButton(
                label: _.page == 2
                    ? LocaleKeys.onboarding_buttons_getStarted.tr()
                    : LocaleKeys.onboarding_buttons_next.tr(),
                textStyle: primaryTextTheme.headlineMedium!,
                backgroundColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                radius: 12,
                height: 60,
                onPressed: () {
                  if (_.page != 2) {
                    _.pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear);
                  } else {
                    _.toSignupPage();
                  }
                },
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            );
          }),
          const SizedBox(
            height: 16,
          ),
          GetBuilder<OnboardingController>(builder: (_) {
            return Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  _.toSignupPage();
                },
                child: Text(
                  LocaleKeys.onboarding_buttons_skip.tr(),
                  style: primaryTextTheme.displaySmall,
                ),
              ),
            );
          })
        ],
      ),
    ));
  }
}
