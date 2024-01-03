import 'package:flutter/material.dart';
import 'package:mobmart/core/constants/assets_constants.dart';

class SocialSignups extends StatelessWidget {
  final void Function() onGoogleTap;
  final void Function() onFbTap;
  const SocialSignups({Key? key, required this.onGoogleTap, required this.onFbTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap:onFbTap,
                child: Container(
                    height: 55,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).shadowColor,
                              blurRadius: 4,
                              spreadRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                            image: AssetImage(AssetsConstants.googleIcon)),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Facebook',
                          style: primaryTextTheme.bodyLarge,
                        )
                      ],
                    )),
              ),
            ),
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: onGoogleTap,
                child: Container(
                    height: 55,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).shadowColor,
                              blurRadius: 4,
                              spreadRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(image: AssetImage(AssetsConstants.fbIcon)),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Google',
                          style: primaryTextTheme.bodyLarge,
                        )
                      ],
                    )),
              ),
            ),
          
        ],
      ),
    );
  }
}
