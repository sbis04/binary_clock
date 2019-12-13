import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum MyThemeKeys { LIGHT, DARK }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      display1: GoogleFonts.alatsi(
        textStyle: TextStyle(
          color: Colors.black38,
          fontSize: 30,
        ),
      ),
      display2: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(
      display1: GoogleFonts.alatsi(
        textStyle: TextStyle(
          color: Colors.black38,
          fontSize: 30,
        ),
      ),
      display2: TextStyle(
        color: Colors.black.withOpacity(0.3),
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
