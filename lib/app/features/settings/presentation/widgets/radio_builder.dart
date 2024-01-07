import 'package:flutter/material.dart';

class RadioBuilder extends StatelessWidget {
  const RadioBuilder({super.key, required this.selected});
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: selected?8: 4,
        height: selected?8: 4,
        color:selected?Theme.of(context).primaryColor: Colors.grey,
      ),
    );
  }
}
