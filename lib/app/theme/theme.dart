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
      const IconThemeData(color: Color(0xffafafaf));
  static IconThemeData lightIconTheme =
      const IconThemeData(color: Color(0xff0E3692));
  static BottomAppBarTheme lightBottomAppBarTheme =
      const BottomAppBarTheme(color: Color(0xffffffff));
  static DrawerThemeData drawerTheme = const DrawerThemeData(
    backgroundColor: Color(0xff1F88C1),
  );

  static DrawerThemeData darkThemeDrawerTheme = const DrawerThemeData(
    backgroundColor: Color(0xff0C4D69),
  );

  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              return Colors.black;
            },
          ),
        ),
        indicatorColor: const Color(0xff1F88C1),
        secondaryHeaderColor: const Color(0xff4d4d4d),
        primaryColor: const Color(0xff0E3692),
        primaryColorDark: const Color(0xff00374E),
        primaryColorLight: const Color(0xff1DCDFE),
        cardColor: const Color(0xfffdfdfd),
        canvasColor: const Color(0xffefefef),
        toggleButtonsTheme: const ToggleButtonsThemeData(
            color: Color(0xfffdfdfd), selectedColor: Color(0xff1DCDFE)),
        dividerColor: const Color(0xffCBF3FC),
        disabledColor: Colors.grey.shade500,
        dialogBackgroundColor: Colors.white,
        drawerTheme: drawerTheme,
        iconTheme: lightIconTheme,
        navigationBarTheme:
            const NavigationBarThemeData(indicatorColor: Color(0xff34f5c5)),
        shadowColor: Colors.grey.shade300,
        scaffoldBackgroundColor: const Color(0xffF2FDFF),
        bottomAppBarTheme: lightBottomAppBarTheme,
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Color(0xffF2FDFF),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xffF2FDFF),
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark, // status bar color
                systemNavigationBarContrastEnforced: false,
                systemNavigationBarColor: Color(0xff1F88C1))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color(0xff1F88C1),
            backgroundColor: Color(0xffffffff)),
        primaryTextTheme: primaryTextThemeLight);
  }

  static ThemeData dark() {
    Color darkThemeColor = const Color(0xff00161f);
    Color darkCardColor = const Color(0xff062735);

    return ThemeData(
        brightness: Brightness.dark,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              return Colors.black;
            },
          ),
        ),
        indicatorColor: const Color(0xff1F88C1),
        secondaryHeaderColor: const Color(0xff4d4d4d),
        primaryColor: const Color(0xff000000),
        primaryColorDark: darkThemeColor,
        dialogBackgroundColor: darkCardColor,
        canvasColor: darkCardColor,
        cardColor: darkCardColor,
        drawerTheme: darkThemeDrawerTheme,
        scaffoldBackgroundColor: darkThemeColor,
        shadowColor: Colors.black87,
        iconTheme: darkIconTheme,
        appBarTheme: AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: darkCardColor,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: darkCardColor,
                statusBarBrightness: Brightness.dark,
                systemNavigationBarContrastEnforced: false,
                systemNavigationBarColor: const Color(0xff1F88C1))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: const Color(0xff29ABE2),
            backgroundColor: darkCardColor),
        primaryTextTheme: primaryTextThemeDark);
  }
}
