import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobmart/core/constants/assets_constants.dart';

class BuyButtonWidget extends StatelessWidget {
  const BuyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Row(children: [
      Container(height: 45, width: 60, 
      decoration: BoxDecoration(color: Theme.of(context).buttonTheme.colorScheme!.primary,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomLeft:  Radius.circular(4), topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SvgPicture.asset(AssetsConstants.actionCartIcon, color: Colors.white, height: 20,width: 20,),
          SizedBox(width: 4,),
          Text("1", style: primaryTextTheme.headlineMedium!.copyWith(color: Colors.white))
        ],),
      ),
      ),
      
      Container(height: 45, width: 120, 
      decoration: BoxDecoration(color: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(0), bottomLeft:  Radius.circular(0), topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
      ),
      child:Center(child: Text("Buy Now", style: primaryTextTheme.headlineMedium!.copyWith(color: Colors.white) ,))
      )
    ],);
  }
}