import 'package:flutter/material.dart';
import 'package:get/get.dart';

// const Color white = Colors.white;
// const Color black = Colors.black;
// const Color darkBackgroundClr = Color(0xFF121212);
// const Color lightBackgroundClr = Color(0xff3451A1);
// const Color darkTextClr = Color(0xFFE3E6E4);
// const Color iconClr = Color(0xff6898e0);
// const Color darkiconClr = Color(0xff1b69ff);
const Color white = Colors.white;
const Color black = Colors.black;
const Color darkBackgroundClr = Color(0xFF121212);
const Color lightBackgroundClr = Color(0xfffafafa);
const Color darkTextClr = Color(0xFFE3E6E4);
const Color darkPrimaryClr = Color(0xFF43766C);
const Color ligthPrimaryClr = Color(0xFF43766C);
const Color iconClr = Color(0xFFB19470);
const Color darkiconClr = Color(0xFF76453B);

class Themes {
  static final light = ThemeData(
      useMaterial3: true,
      primaryColor: lightBackgroundClr,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: ligthPrimaryClr,
        onPrimary: Colors.black,
        secondary: ligthPrimaryClr,
        onSecondary: ligthPrimaryClr,
        error: Colors.red,
        onError: Colors.red,
        background: lightBackgroundClr,
        onBackground: black,
        surface: lightBackgroundClr,
        onSurface: black,
      ),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(iconColor: MaterialStatePropertyAll(darkiconClr))),
      splashColor: ligthPrimaryClr.withOpacity(0.2),
      hoverColor: Colors.transparent,
      highlightColor: ligthPrimaryClr.withOpacity(0.2),
      fontFamily: 'Ibmp',
      iconTheme: const IconThemeData(color: darkiconClr));
  static final dark = ThemeData(
      useMaterial3: true,
      primaryColor: darkBackgroundClr,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: darkPrimaryClr,
        onPrimary: Colors.white,
        secondary: darkPrimaryClr,
        onSecondary: darkPrimaryClr,
        error: Colors.red,
        onError: Colors.red,
        background: darkBackgroundClr,
        onBackground: darkTextClr,
        surface: darkBackgroundClr,
        onSurface: darkTextClr,
      ),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(iconColor: MaterialStatePropertyAll(iconClr))),
      splashColor: darkPrimaryClr.withOpacity(0.2),
      hoverColor: Colors.transparent,
      highlightColor: darkPrimaryClr.withOpacity(0.2),
      fontFamily: 'Ibmp',
      iconTheme: const IconThemeData(color: iconClr));
}

TextStyle get textStyle => TextStyle(
      fontFamily: 'Ibmp',
      color: Get.isDarkMode ? darkTextClr : black,
    );

TextStyle get headeTtextStyle => const TextStyle(
      fontFamily: 'Ibmp',
      fontSize: 14,
      overflow: TextOverflow.ellipsis,
    );
