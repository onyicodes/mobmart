import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobmart/core/constants/assets_constants.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final bool isPasswordField;
  final Color fillColor;
  final void Function(String value) onChanged;
  final TextInputType inputType;

  const CustomSearchField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.fillColor,
      this.isPasswordField = false,
      required this.inputType,
      required this.onChanged,
      required this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Flexible(
      child: SizedBox(
        height: 45,
        child: TextField(
            controller: controller,
            textCapitalization: TextCapitalization.words,
            autocorrect: false,
            onChanged: onChanged,
            style: primaryTextTheme.bodyLarge!.copyWith(fontSize: 24),
            decoration: InputDecoration(
                prefixIconConstraints: const BoxConstraints(
                    maxWidth: 55, minWidth: 50, minHeight: 30, maxHeight: 35),
                prefixIcon: SvgPicture.asset(AssetsConstants.actionSearchIcon),
                errorText: errorText.isEmpty ? null : errorText,
                hintText: hintText,
                hintStyle: primaryTextTheme.bodyLarge!
                    .copyWith(color: Theme.of(context).hintColor),
                fillColor: fillColor,
                filled: true,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                contentPadding: const EdgeInsets.only(
                    left: 24.0, top: 16.0, bottom: 16.0, right: 16.0),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).hintColor),
                    gapPadding: 20.0,
                    borderRadius: const BorderRadius.all(Radius.circular(8)))),
          ),
      ),
    );
  }
}
