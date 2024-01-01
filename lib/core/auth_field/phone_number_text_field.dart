import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneInputTextField extends StatefulWidget {
  final PhoneController controller;
  final String label;
  final String hintText;
  final String errorText;
  final void Function(PhoneNumber? p) onChanged;

  const PhoneInputTextField(
      {Key? key,
      required this.controller,
      required this.errorText,
      required this.hintText,
      required this.label,
      required this.onChanged})
      : super(key: key);

  @override
  State<PhoneInputTextField> createState() => _PhoneInputTextFieldState();
}

class _PhoneInputTextFieldState extends State<PhoneInputTextField> {
  FocusNode myNode = FocusNode();
  bool hasFocus = false;
  @override
  void initState() {
    super.initState();
    myNode.addListener(() {
      setState(() {
        hasFocus = myNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    myNode.removeListener(() {});
    myNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return GestureDetector(
      onTap: () {
        myNode.requestFocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: widget.errorText.isNotEmpty
                          ? Colors.red
                          : hasFocus
                              ? Colors.green
                              : Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(widget.label,
                        style: primaryTextTheme.displaySmall),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: PhoneFormField(
                      key: Key('phone-field'),
                      controller: widget.controller, // controller & initialValue value
                      initialValue: null, // can't be supplied simultaneously
                      shouldFormat: true, // default
                      defaultCountry: IsoCode.NG, // default
                      decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 35, minHeight: 20),
                          // errorText: widget.errorText.isEmpty
                          //     ? null
                          //     : widget.errorText,
                         
                          hintText: widget.hintText,
                          hintStyle: primaryTextTheme.bodyLarge!
                              .copyWith(color: Theme.of(context).hintColor),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.only(
                              left: 4.0, top: 4.0, bottom: 4.0, right: 4.0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                      validator: PhoneValidator.none, // default PhoneValidator.valid()
                      isCountryChipPersistent: false, // default
                      isCountrySelectionEnabled: true, // default
                      countrySelectorNavigator:
                          const CountrySelectorNavigator.bottomSheet(),
                      showFlagInInput: true, // default
                      flagSize: 16, // default
                      autofillHints: const [
                        AutofillHints.telephoneNumber
                      ], // default to null
                      enabled: true, // default
                      autofocus: false, // default
                      onSaved: (PhoneNumber? p) {
                        print('saved $p');
                      }, // default null
                      onChanged:widget.onChanged, // default null
                      // ... + other textfield params
                    )
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.errorText,
                style: primaryTextTheme.bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.error),
              ),
            )
          ],
        ),
      ),
    );
  }
}
