import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quran/ui/size_config.dart';

import '../controller/islamic_controller.dart';

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
    int daysRemaining = islamicController.calculate(year, month, day);
    return Padding(
      padding: EdgeInsets.only(
          left: 15, right: 15, top: 5, bottom: isLastOne ? 20 : 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            LinearProgressIndicator(
              minHeight: MediaQuery.sizeOf(context).height / 11,
              value: (1.0 - (daysRemaining / 355))
                  .clamp(0.0, 1.0), //(daysRemaining / 1000).toDouble(),
              // backgroundColor: Theme.of(context).canvasColor,
              color: daysRemaining == 0
                  ? Theme.of(context).colorScheme.onSecondary.withOpacity(0.4)
                  : Theme.of(context).colorScheme.onSecondary.withOpacity(0.4),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height / 11,
              decoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.onSecondary.withOpacity(0.2),
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
                              color: getColor(daysRemaining)),
                        ),
                        FittedBox(
                          child: Text(
                            "$year/$month/$day",
                            style: TextStyle(color: getColor(daysRemaining)),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      daysRemaining == 0
                          ? 'قد مضى'
                          : "$daysRemaining\n${daysRemaining > 10 || daysRemaining == 1 ? 'يـوم' : 'أيـام'}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(13),
                          color: getColor(daysRemaining)
                          // fontWeight: FontWeight.bold,
                          ),
                      // style: Theme.of(context).textTheme.displayMedium,
                    )
                  ],
                ),
              ),
            ),
            // Container(
            //   width: islamicController.calculateProgress(
            //     HijriCalendar.now().hDay,
            //     leftDays,
            //     // MediaQuery.sizeOf(context).width,
            //   ),
            //   height: MediaQuery.sizeOf(context).height / 11,
            //   decoration: BoxDecoration(
            //     color:
            //         Theme.of(context).colorScheme.onSecondary.withOpacity(0.4),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

getColor(int daysRemaining) {
  if (daysRemaining > 355) {
    if (Get.isDarkMode) {
      return Colors.white38;
    } else {
      return Colors.black38;
    }
  }
}
