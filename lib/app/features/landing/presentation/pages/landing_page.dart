import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:mobmart/app/features/home/presentation/pages/home.dart';
import 'package:mobmart/app/features/landing/presentation/controllers/landing_controller.dart';
import 'package:mobmart/core/constants/assets_constants.dart';
import 'package:mobmart/generated/locale_keys.g.dart';

class LandingPage extends GetView<LandingController> {
  LandingPage({Key? key}) : super(key: key) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
      ],
    );

     SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
     statusBarBrightness: Brightness.light,
     statusBarIconBrightness: Brightness.light// status bar color
  ));
    
  }
  final List<Widget> pages = const [
    Home(),
    Text("Voucher"),
    Text("Wallet"),
    Text("Settings")
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return GetBuilder<LandingController>(
       builder: (_) {
      return WillPopScope(
        onWillPop: () async {
          if (DateTime.now().difference(_.lastExitTime) >=
              const Duration(seconds: 2)) {
            //showing message to user
            _.pressToExit();
            _.lastExitTime = DateTime.now();
            return false; // disable back press
          } else {
            return true; //  exit the app
          }
        },
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            bottomNavigationBar: MediaQuery.of(context).size.width < 680
                ? GetX<LandingController>(builder: (_) {
                    return NavigationBar(
                        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                        onDestinationSelected: (index) {
                          _.currentPageIndex = index;
                        },
                        selectedIndex: _.currentPageIndex,
                        destinations: [
                          NavigationDestination(
                            
                            icon: SvgPicture.asset(
                              AssetsConstants.navbarUnselectedHome,
                                height: 30,
                              width:30,
                            ),
                            selectedIcon: SvgPicture.asset(
                              AssetsConstants.navbarSelectedHome,
                               height: 30,
                              width:30,
                            ),
                            label: LocaleKeys.navBar_home.tr(),
                          ),
                          NavigationDestination(
                            selectedIcon: SvgPicture.asset(
                              AssetsConstants.navbarSelectedVoucher,
                                height: 30,
                              width:30,
                            ),
                            icon: SvgPicture.asset(
                              AssetsConstants.navbarUnselectedVoucher,
                                height: 30,
                              width:30,
                            ),
                            label: LocaleKeys.navBar_voucher.tr(),
                          ),
                          NavigationDestination(
                              icon: SvgPicture.asset(
                                AssetsConstants.navbarUnselectWallet,
                                  height: 30,
                              width:30,
                              ),
                              selectedIcon: SvgPicture.asset(
                                AssetsConstants.navbarSelectWallet,
                                  height: 30,
                              width:30,
                              ),
                              label: LocaleKeys.navBar_wallet.tr()),
                          NavigationDestination(
                              icon: SvgPicture.asset(
                                AssetsConstants.navbarUnselectedSettings,
                                 height: 30,
                              width:30,
                              ),
                              selectedIcon: SvgPicture.asset(
                                AssetsConstants.navbarSelectedSettings,
                                 height: 30,
                              width:30,
                              ),
                              label: LocaleKeys.navBar_settings.tr()),
                        ]);
                  })
                : null,
            body: GetX<LandingController>(
              builder: (_) {
                return Row(
                  children: [
                    if (MediaQuery.of(context).size.width >= 680)
                      SizedBox(
                        width: 130,
                        child: NavigationRail(
                          destinations: <NavigationRailDestination>[
                            NavigationRailDestination(
                              icon: SvgPicture.asset(
                                AssetsConstants.navbarUnselectedHome,
                                 height: 30,
                              width:30,
                              ),
                              selectedIcon: SvgPicture.asset(
                                AssetsConstants.navbarSelectedHome,
                                 height: 30,
                              width:30,
                              ),
                              label: Text(
                                LocaleKeys.navBar_home.tr(),
                                style: primaryTextTheme.headlineSmall,
                              ),
                            ),
                            NavigationRailDestination(
                                selectedIcon: SvgPicture.asset(
                                  AssetsConstants.navbarSelectedVoucher,
                                   height: 30,
                              width:30,
                                ),
                                icon: SvgPicture.asset(
                                  AssetsConstants.navbarUnselectedVoucher,
                                   height: 30,
                              width:30,
                                ),
                                label: Text(
                                  LocaleKeys.navBar_voucher.tr(),
                                  style: primaryTextTheme.headlineSmall,
                                )),
                            NavigationRailDestination(
                                icon: SvgPicture.asset(
                                  AssetsConstants.navbarUnselectWallet,
                                   height: 30,
                              width:30,
                                ),
                                selectedIcon: SvgPicture.asset(
                                  AssetsConstants.navbarSelectWallet,
                                   height: 30,
                              width:30,
                                ),
                                label: Text(
                                  LocaleKeys.navBar_wallet.tr(),
                                  style: primaryTextTheme.headlineSmall,
                                )),
                            NavigationRailDestination(
                                icon: SvgPicture.asset(
                                  AssetsConstants.navbarUnselectedSettings,
                                   height: 30,
                              width:30,
                                ),
                                selectedIcon: SvgPicture.asset(
                                  AssetsConstants.navbarSelectedSettings,
                                   height: 30,
                              width:30,
                                ),
                                label: Text(
                                  LocaleKeys.navBar_settings.tr(),
                                  style: primaryTextTheme.headlineSmall,
                                )),
                          ],
                          selectedIndex: _.currentPageIndex,
                          labelType: NavigationRailLabelType.selected,
                          onDestinationSelected: (index) {
                            _.currentPageIndex = index;
                          },
                        ),
                      ),
                    if (MediaQuery.of(context).size.width >= 680)
                      const VerticalDivider(thickness: 1, width: 1),
                    Expanded(
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: MediaQuery.of(context).size.width >=
                                      680
                                  ? [
                                      BoxShadow(
                                          color: Theme.of(context).shadowColor,
                                          blurRadius: 0.5,
                                          spreadRadius: 3)
                                    ]
                                  : null),
                          width: MediaQuery.of(context).size.width >= 680
                              ? MediaQuery.of(context).size.width * 0.6
                              : MediaQuery.of(context).size.width,
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context)
                                .copyWith(scrollbars: false),
                            child: IndexedStack(
                              index: _.currentPageIndex,
                              children: pages,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
