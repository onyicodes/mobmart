import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MobMartAppTheme {
  static Color lightThemeTextColor = const Color(0xff4d4d4d);
  static Color darkThemeTextColor = const Color(0xfffefefe);

  static TextTheme primaryTextThemeLight = TextTheme(
    bodyLarge: GoogleFonts.inter(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: lightThemeTextColor,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: lightThemeTextColor,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: lightThemeTextColor,
    ),
    displayLarge: GoogleFonts.inter(
      fontSize: 34.0,
      fontWeight: FontWeight.w700,
      color: lightThemeTextColor,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: lightThemeTextColor,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: lightThemeTextColor,
    ),
    headlineLarge: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: lightThemeTextColor,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: lightThemeTextColor,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: lightThemeTextColor,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: lightThemeTextColor,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: lightThemeTextColor,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: lightThemeTextColor,
    ),
  );

  static TextTheme primaryTextThemeDark = TextTheme(
    bodyLarge: GoogleFonts.inter(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
    displayLarge: GoogleFonts.roboto(
      fontSize: 34.0,
      fontWeight: FontWeight.w700,
      color: darkThemeTextColor,
    ),
    displayMedium: GoogleFonts.roboto(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: darkThemeTextColor,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: darkThemeTextColor,
    ),
    headlineLarge: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: darkThemeTextColor,
    ),
    headlineMedium: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: darkThemeTextColor,
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
  );

  static IconThemeData darkIconTheme =
      const IconThemeData(color: Color(0xffffffff));
  static IconThemeData lightIconTheme =
      const IconThemeData(color: Color(0xff000000), size: 30);
  static BottomAppBarTheme lightBottomAppBarTheme =
      const BottomAppBarTheme(color: Color(0xffffffff));
  static DrawerThemeData drawerTheme = const DrawerThemeData(
    backgroundColor: Color(0xff1F88C1),
  );

  static NavigationBarThemeData lightNavigationBarThemeData =
      NavigationBarThemeData(
    indicatorColor: Colors.transparent,
    iconTheme: MaterialStateProperty.all(lightIconTheme),
  );

  static ButtonThemeData lightButtonTheme = const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: Color(0xff67c4a9),
      secondary: Color(0xff47b897),
      surface: Color(0xffffffff),
      background: Color(0xffb6e2d5),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xff000000),
      onSecondary: Color(0xff000000),
      onSurface: Color(0xff000000),
      onBackground: Color(0xff000000),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
  );

  static DialogTheme ligthDialogTheme = const DialogTheme(
      shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  ));

  static DrawerThemeData darkThemeDrawerTheme = const DrawerThemeData(
    backgroundColor: Color(0xff0C4D69),
  );

  static BadgeThemeData badgeThemeData =
      BadgeThemeData(backgroundColor: Colors.red, textColor: Colors.white, textStyle: primaryTextThemeLight.bodyMedium);


  static ThemeData light() {
    return ThemeData(
        primarySwatch: const MaterialColor(4284990633, {
          50: Color(0xffedf8f5),
          100: Color(0xffdaf1ea),
          200: Color(0xffb6e2d5),
          300: Color(0xff91d4c1),
          400: Color(0xff6cc6ac),
          500: Color(0xff47b897),
          600: Color(0xff399379),
          700: Color(0xff2b6e5b),
          800: Color(0xff1d493c),
          900: Color(0xff0e251e)
        }),
        brightness: Brightness.light,
        primaryColor: Color(0xff67c4a9),
        primaryColorLight: Color(0xffdaf1ea),
        primaryColorDark: Color(0xff2b6e5b),
        canvasColor: Color(0xfffafafa),
        scaffoldBackgroundColor: Color(0xfff1f1f1),
        cardColor: Color(0xffffffff),
        dividerColor: Color(0x1f000000),
        highlightColor: Color(0x66bcbcbc),
        splashColor: Color(0x66c8c8c8),
        unselectedWidgetColor: Color(0x8a000000),
        disabledColor: Color(0x61000000),
        secondaryHeaderColor: Color(0xffedf8f5),
        dialogBackgroundColor: Color(0xffffffff),
        indicatorColor: Color(0xff47b897),
        hintColor: Color(0x8a000000),
        badgeTheme: badgeThemeData,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              return Colors.black;
            },
          ),
        ),
        toggleButtonsTheme: const ToggleButtonsThemeData(
            color: Color(0xfffdfdfd), selectedColor: Color(0xff1DCDFE)),
        drawerTheme: drawerTheme,
        iconTheme: lightIconTheme,
        navigationBarTheme: lightNavigationBarThemeData,
        shadowColor: Colors.grey.shade300,
        buttonTheme: lightButtonTheme,
        bottomAppBarTheme: lightBottomAppBarTheme,
        dialogTheme: ligthDialogTheme,
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Color(0xfff1f1f1),
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.white, // navigation bar color
              statusBarColor: Color(0xfff1f1f1),
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark, // status bar color
              systemNavigationBarContrastEnforced: true,
            )),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        primaryTextTheme: primaryTextThemeLight);
  }

  static ButtonThemeData darkButtonThemeData = const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xff399379),
    disabledColor: Color(0x61ffffff),
    highlightColor: Color(0x29ffffff),
    splashColor: Color(0x1fffffff),
    focusColor: Color(0x1fffffff),
    hoverColor: Color(0x0affffff),
    colorScheme: ColorScheme(
      primary: Color(0xff67c4a9),
      secondary: Color(0xff64ffda),
      surface: Color(0xff424242),
      background: Color(0xff616161),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xff000000),
      onSecondary: Color(0xff000000),
      onSurface: Color(0xffffffff),
      onBackground: Color(0xff000000),
      onError: Color(0xff000000),
      brightness: Brightness.dark,
    ),
  );

  static DialogTheme darkDialogTheme = const DialogTheme(
      shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  ));

  static NavigationBarThemeData darkNavigationBarThemeData =
      const NavigationBarThemeData(indicatorColor: Colors.transparent);

  static ThemeData dark() {
    Color darkThemeColor = const Color(0xff00161f);
    Color darkCardColor = const Color(0xff062735);

    return ThemeData(
        primarySwatch: const MaterialColor(4280361249, {
          50: Color(0xfff2f2f2),
          100: Color(0xffe6e6e6),
          200: Color(0xffcccccc),
          300: Color(0xffb3b3b3),
          400: Color(0xff999999),
          500: Color(0xff808080),
          600: Color(0xff666666),
          700: Color(0xff4d4d4d),
          800: Color(0xff333333),
          900: Color(0xff191919)
        }),
        brightness: Brightness.dark,
        primaryColor: Color(0xff212121),
        primaryColorLight: Color(0xff9e9e9e),
        primaryColorDark: Color(0xff000000),
        canvasColor: Color(0xff303030),
        scaffoldBackgroundColor: Color(0xff303030),
        cardColor: Color(0xff424242),
        dividerColor: Color(0x1fffffff),
        highlightColor: Color(0x40cccccc),
        splashColor: Color(0x40cccccc),
        unselectedWidgetColor: Color(0xb3ffffff),
        disabledColor: Color(0x62ffffff),
        secondaryHeaderColor: Color(0xff616161),
        dialogBackgroundColor: Color(0xff424242),
        indicatorColor: Color(0xff64ffda),
        hintColor: Color(0x80ffffff),
        dialogTheme: darkDialogTheme,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              return Colors.black;
            },
          ),
        ),
        drawerTheme: darkThemeDrawerTheme,
        shadowColor: Colors.black87,
        iconTheme: darkIconTheme,
        buttonTheme: darkButtonThemeData,
        appBarTheme: AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: darkCardColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Color(0xff303030),
                statusBarBrightness: Brightness.dark,
                systemNavigationBarContrastEnforced: false,
                systemNavigationBarColor: Color(0xff303030))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        navigationBarTheme: darkNavigationBarThemeData,
        primaryTextTheme: primaryTextThemeDark);
  }
}
