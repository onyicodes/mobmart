import 'package:flutter/material.dart';
import 'package:mobmart/core/constants/general_constants.dart';
import 'package:mobmart/core/general_widgets/custom_list_space.dart';
import 'package:mobmart/core/general_widgets/custom_search_field.dart';

class SearchAppBar extends StatelessWidget {
  final Color backgroundColor;
  final List<Widget> actionWidgets;
  const SearchAppBar({super.key, required this.backgroundColor, required this.actionWidgets});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSearchField(
            controller: TextEditingController(),
            hintText: 'Search...',
            fillColor: backgroundColor,
            inputType: TextInputType.text,
            onChanged: (value) {},
            errorText: ''),
            SizedBox(width: ListSpacingValue.spacingV16.value),
            for(var widget in actionWidgets)

            Padding(padding:const EdgeInsets.all(4) , child: widget,)
            
      ],
    );
  }
}
