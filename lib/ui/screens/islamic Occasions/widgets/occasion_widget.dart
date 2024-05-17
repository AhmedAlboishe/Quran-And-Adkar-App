import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';

import 'package:quran/core/helper/arabic_number.dart';
import 'package:quran/ui/screens/islamic%20Occasions/controller/islamic_controller.dart';
import 'package:quran/ui/size_config.dart';

class OccasionWidget extends StatelessWidget {
  const OccasionWidget(
      {super.key,
      required this.occasionTitle,
      required this.year,
      required this.month,
      required this.day,
      this.isLastOne = false});
  final String occasionTitle;
  final int year;
  final int month;
  final int day;
  final bool isLastOne;

  @override
  Widget build(BuildContext context) {
    IslamicController islamicController = Get.put(IslamicController());
    int leftDays = islamicController.calucate(year, month, day);
    return Padding(
      padding: EdgeInsets.only(
          left: 15, right: 15, top: 5, bottom: isLastOne ? 20 : 5),
      child: Stack(
        children: [
          Container(
            width: islamicController.calculateProgress2(
              HijriCalendar.now().hDay,
              leftDays,
              MediaQuery.sizeOf(context).width,
            ),
            height: MediaQuery.sizeOf(context).height / 11,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.4),
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height / 11,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        occasionTitle,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          "${year.toArabic()}/${month.toArabic()}/${day.toArabic()}",
                          // style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    leftDays == 0
                        ? 'قد مضى'
                        : "${leftDays.toArabic()}\n${leftDays > 10 || leftDays == 1 ? 'يـوم' : 'أيـام'}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                      // fontWeight: FontWeight.bold,
                    ),
                    // style: Theme.of(context).textTheme.displayMedium,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
