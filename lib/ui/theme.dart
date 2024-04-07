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
const Color darkiconClr = Color(0xFFB19470);
const Color ligthiconClr = Color(0xFF76453B);

//تجربة الالوان بتطبيق القران
const Color c1 = Color(0xFFF3E9DC);
const Color c2 = Color(0xFFC08552);
const Color c3 = Color(0xFF5E3023);
const Color c4 = Color(0xFF895737);
const Color c5 = Color(0xFFDAB49D);

class Themes {
  static final light = ThemeData(
    useMaterial3: true,
    primaryColor: lightBackgroundClr,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: c3,
      onPrimary: Colors.black,
      secondary: c3,
      onSecondary: c3,
      error: Colors.red,
      onError: Colors.red,
      background: c1,
      onBackground: black,
      surface: c1,
      onSurface: black,
    ),
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(iconColor: MaterialStatePropertyAll(ligthiconClr))),
    splashColor: ligthiconClr.withOpacity(0.2),
    hoverColor: Colors.transparent,
    highlightColor: ligthiconClr.withOpacity(0.1),
    fontFamily: 'Ibmp',
    iconTheme: const IconThemeData(color: ligthiconClr),
  );
  // dark ************************************************************* dark
  static final dark = ThemeData(
      useMaterial3: true,
      primaryColor: darkBackgroundClr,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: c4,
        onPrimary: Colors.white,
        secondary: c4,
        onSecondary: c4,
        error: Colors.red,
        onError: Colors.red,
        background: darkBackgroundClr,
        onBackground: darkTextClr,
        surface: darkBackgroundClr,
        onSurface: darkTextClr,
      ),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(iconColor: MaterialStatePropertyAll(darkiconClr))),
      splashColor: darkiconClr.withOpacity(0.2),
      hoverColor: Colors.transparent,
      highlightColor: darkiconClr.withOpacity(0.1),
      fontFamily: 'Ibmp',
      iconTheme: const IconThemeData(color: darkiconClr));
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
