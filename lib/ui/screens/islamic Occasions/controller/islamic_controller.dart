import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quran/core/helper/custom_orientation.dart';

class IslamicController extends GetxController {
  // int calucate(int year, int month, int day) {
  //   HijriCalendar hijriCalendar = HijriCalendar();
  //   DateTime start = DateTime.now();
  //   DateTime end = hijriCalendar.hijriToGregorian(year, month, day);
  //   if (!start.isAfter(end)) {
  //     // this if the end date is aftar the start date will do this logic
  //     return DateTimeRange(start: start, end: end).duration.inDays + 1;
  //   } else {
  //     // this if the end date is before the start date will do the else logic
  //     // end = end.copyWith(year: end.year + 1); // uncomment this if you want to make it calucate the next year occasion
  //     // return DateTimeRange(start: end, end: start).duration.inDays; // you can make this like مضى X ايام
  //     return 0;
  //   }
  // }

  // // double calculateProgress(int currentIndex, int total) {
  // //   int totalPages = total;
  // //   if (currentIndex < 1) {
  // //     return 0.0;
  // //   }
  // //   if (currentIndex > totalPages) {
  // //     return 100.0;
  // //   }
  // //   return (currentIndex / totalPages) * Get.width - 30;
  // // }

  // double calculateProgress2(
  //     int currentDay, int daysUntilEvent, double totalWidth) {
  //   // Assuming currentDay is the day of the month and daysUntilEvent is the total days remaining until the event
  //   double progressFraction = currentDay / (currentDay + daysUntilEvent);
  //   if ((progressFraction * totalWidth) >= 300) {
  //     return (progressFraction * totalWidth) - 15;
  //   } else {
  //     return progressFraction * totalWidth;
  //   }
  //   // Calculate the proportional width based on progress
  // }

  int calculate(int year, int month, int day) {
    HijriCalendar hijriCalendar = HijriCalendar();
    DateTime start = DateTime.now();
    DateTime end = hijriCalendar.hijriToGregorian(year, month, day);
    if (!start.isAfter(end)) {
      // this if the end date is aftar the start date will do this logic
      return DateTimeRange(start: start, end: end).duration.inDays;
    } else {
      // this if the end date is before the start date will do the else logic
      // end = end.copyWith(year: end.year + 1); // uncomment this if you want to make it calucate the next year occasion
      // return DateTimeRange(start: end, end: start).duration.inDays; // you can make this like مضى X ايام
      return 0;
    }
  }

  double calculateProgress(int currentIndex, int total) {
    int totalPages = total;
    if (currentIndex < 1) {
      return 0.0;
    }
    if (currentIndex > totalPages) {
      return 100.0;
    }
    return ((currentIndex / totalPages) *
        Get.context!.customOrientation(Get.width * .8, Get.width * .4));
  }
}
