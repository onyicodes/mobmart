import 'package:easy_localization/easy_localization.dart';
import 'package:mobmart/app/features/onboarding/data/model/onboard_seller_content_model.dart';
import 'package:get/get_connect/connect.dart';
import 'package:mobmart/generated/locale_keys.g.dart';


abstract class OnboardContentLocalDataSource extends GetConnect {
  Future<List<OnboardContentModel>> fetchOnboardingContents();
}

class OnboardContentLocalDataSourceImpl extends OnboardContentLocalDataSource {
// Get request

  @override
  Future<List<OnboardContentModel>> fetchOnboardingContents() async {
    List<Map<String, String>> onboardingContents = [
      {
        "imageUrl": LocaleKeys.onboarding_contents_page1_image.tr(),
        "title": LocaleKeys.onboarding_contents_page1_title.tr(),
        "subtitle": LocaleKeys.onboarding_contents_page1_subtitle.tr()
      },
      {
        "imageUrl": LocaleKeys.onboarding_contents_page2_image.tr(),
        "title": LocaleKeys.onboarding_contents_page2_title.tr(),
        'subtitle': LocaleKeys.onboarding_contents_page2_subtitle.tr(),
      },
      {
        "imageUrl": LocaleKeys.onboarding_contents_page3_image.tr(),
        "title": LocaleKeys.onboarding_contents_page3_title.tr(),
        "subtitle": LocaleKeys.onboarding_contents_page3_subtitle.tr(),
      }
    ];

    final List<OnboardContentModel> onboardContentModelList =
        onboardingContents.map((e) => OnboardContentModel.fromJson(e)).toList();

    
    return onboardContentModelList;
  }
}
