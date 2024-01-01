import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobmart/core/constants/assets_constants.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/button_widget.dart';
import 'package:mobmart/core/general_widgets/custom_list_space.dart';
import 'package:mobmart/generated/locale_keys.g.dart';

class ErrorHandlerWidget extends StatelessWidget {
  final String message;
  final void Function()? onReload;
  final bool centerMessage;
  const ErrorHandlerWidget({super.key, required this.message, this.centerMessage=false, this.onReload});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomListSpacing( spacingValue: ListSpacingValue.spacingV24.value),
        
         if (message == LocaleKeys.error_networkError.tr())
        Align(
          alignment: Alignment.center,
          child: SizedBox(width: 100, child: selectIcon(message: message)),
        ),
        Padding(
          padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 0,),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                message,
                style: primaryTextTheme.displaySmall!
                    .copyWith(color: Theme.of(context).primaryColor),
              )),
        ),
        CustomListSpacing( spacingValue: ListSpacingValue.spacingV24.value),
        if (onReload != null)
          Align(
              alignment: Alignment.center,
              child: CustomButton(
                  label: LocaleKeys.buttons_reload.tr(),
                  onPressed: onReload,
                  backgroundColor: Colors.transparent,
                  borderColor: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).primaryColor,
                  width: 100,
                  textStyle:primaryTextTheme.headlineMedium!,
                  height: 40)),
        CustomListSpacing( spacingValue: ListSpacingValue.spacingV54.value)
      ],
    );
  }

  Widget selectIcon({required String message}) {
    if (message == LocaleKeys.error_networkError.tr()) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          AssetsConstants.connectionErrorSvgIcon,
          width: 150,
        ),
      );
    } else if (message == LocaleKeys.error_noResultError.tr()) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AssetsConstants.notFoundErrorImage,
          width: 100,
        ),
      );
    } else if (message == LocaleKeys.error_noResultError.tr()) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AssetsConstants.unknownErrorImage,
          width: 100,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
