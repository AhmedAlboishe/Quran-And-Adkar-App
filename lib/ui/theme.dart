import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color white = Colors.white;
const Color black = Colors.black;
const Color darkBackgroundClr = Color(0xFF121212);
const Color lightBackgroundClr = Color(0xff3451A1);
const Color darkTextClr = Color(0xFFE3E6E4);
const Color iconClr = Color(0xff6898e0);
const Color darkiconClr = Color(0xff1b69ff);

class Themes {
  static final light = ThemeData(
      useMaterial3: true,
      primaryColor: lightBackgroundClr,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: darkiconClr,
        onPrimary: Colors.black,
        secondary: darkiconClr,
        onSecondary: darkiconClr,
        error: Colors.red,
        onError: Colors.red,
        background: Color(0xfffafafa),
        onBackground: black,
        surface: Color(0xfffafafa),
        onSurface: black,
      ),
      splashColor: darkiconClr.withOpacity(0.1),
      hoverColor: Colors.transparent,
      highlightColor: darkiconClr.withOpacity(0.1),
      fontFamily: 'Ibmp',
      iconTheme: const IconThemeData(color: black));
  static final dark = ThemeData(
      useMaterial3: true,
      primaryColor: darkBackgroundClr,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: iconClr,
        onPrimary: Colors.white,
        secondary: iconClr,
        onSecondary: iconClr,
        error: Colors.red,
        onError: Colors.red,
        background: darkBackgroundClr,
        onBackground: darkTextClr,
        surface: darkBackgroundClr,
        onSurface: darkTextClr,
      ),
      splashColor: iconClr.withOpacity(0.1),
      hoverColor: Colors.transparent,
      highlightColor: iconClr.withOpacity(0.1),
      fontFamily: 'Ibmp',
      iconTheme: const IconThemeData(color: darkTextClr));
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
