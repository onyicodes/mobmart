import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:mobmart/app/features/home/presentation/controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
        
       
        body: ListView(
          shrinkWrap: true,
          children: [
            
          ],
        ));
  }
}
