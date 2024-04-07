import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages.dart';


TextSpan span({
  required String text,
  required int pageIndex,
  required bool isSelected,
  required double fontSize,
  required int surahNum,
  required int ayahNum,
  required LongPressStartDetailsFunction onLongPressStart,
  required bool isFirstAyah,
  required Color textClr,
  required Color ayaaNumClr,

}) {
  if (text.isNotEmpty) {
    final String partOne = text.length < 3 ? text[0] : text[0] + text[1]; //new
    final String? partTwo =
        text.length > 2 ? text.substring(2, text.length - 1) : null; //new
    final String initialPart = text.substring(0, text.length - 1);
    final String lastCharacter = text.substring(text.length - 1);
    TextSpan? first; //new
    TextSpan? second; //new
    if (isFirstAyah) {
      //new
      print(initialPart);
      first = TextSpan(
        text: partOne,
        style: TextStyle(
          fontFamily: 'page${pageIndex + 1}',
          fontSize: fontSize,
          height: 2,
          letterSpacing: 6,
          color: textClr,
          backgroundColor:
              isSelected ? Get.theme.highlightColor : Colors.transparent,
        ),
        recognizer: LongPressGestureRecognizer(
            duration: const Duration(milliseconds: 500))
          ..onLongPressStart = onLongPressStart,
      );
      //*****************
      second = TextSpan(
        text: partTwo,
        style: TextStyle(
          
          fontFamily: 'page${pageIndex + 1}',
          fontSize: fontSize,
          height: 2,
          letterSpacing: 2,
          // wordSpacing: wordSpacing + 10,
          color:textClr,
          backgroundColor:
              isSelected ? Get.theme.highlightColor : Colors.transparent,
        ),
        recognizer: LongPressGestureRecognizer(
            duration: const Duration(milliseconds: 500))
          ..onLongPressStart = onLongPressStart,
      );
    }


    // هذه ماتغيرت
    final TextSpan initialTextSpan = TextSpan(
      text: initialPart,
      style: TextStyle(
        fontFamily: 'page${pageIndex + 1}',
        fontSize: fontSize,
        height: 2,
        letterSpacing: 2,
        color: textClr,
        backgroundColor:
            isSelected ? Get.theme.highlightColor : Colors.transparent,
      ),
      recognizer: LongPressGestureRecognizer(
          duration: const Duration(milliseconds: 500))
        ..onLongPressStart = onLongPressStart,
    );

    final TextSpan lastCharacterSpan = TextSpan(
      text: lastCharacter,
      style: TextStyle(
        fontFamily: 'page${pageIndex + 1}',
        fontSize: fontSize,
        height: 2,
        letterSpacing: text.length < 3 ? 6 : 2, //new
        color: ayaaNumClr,
        backgroundColor:
            isSelected ? Get.theme.highlightColor : Colors.transparent,
      ),
      recognizer: LongPressGestureRecognizer(
          duration: const Duration(milliseconds: 500))
        ..onLongPressStart = onLongPressStart,
    );

    return TextSpan(
      children: isFirstAyah
          ? [first!, second!, lastCharacterSpan] //new
          : [initialTextSpan, lastCharacterSpan],
      recognizer: LongPressGestureRecognizer(
          duration: const Duration(milliseconds: 500))
        ..onLongPressStart = onLongPressStart,
    );
  } else {
    return const TextSpan(text: '');
  }
}
