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
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            PhoneFormField(
              key: const Key('phone-field'),
              controller: widget.controller, // controller & initialValue value
              initialValue: null, // can't be supplied simultaneously
              shouldFormat: true, // default
              defaultCountry: IsoCode.NG, // default
              decoration: InputDecoration(
                  errorText: widget.errorText.isEmpty
                      ? null
                      : widget.errorText,
                  hintText: widget.hintText,
                  hintStyle: primaryTextTheme.bodyLarge!
                      .copyWith(color: Theme.of(context).hintColor),
                  focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(12))),
              contentPadding: const EdgeInsets.all(16.0),
              border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).dividerColor),
              borderRadius:
                  const BorderRadius.all(Radius.circular(12)))
                  
                      ),
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
          ],
        ),
      ),
    );
  }
}
