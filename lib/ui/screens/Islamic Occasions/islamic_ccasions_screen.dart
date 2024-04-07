import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quran/ui/screens/notifications/model/notification_model.dart';
import 'package:quran/ui/size_config.dart';

import '../../theme.dart';

class IslamicOccasionsScreen extends StatefulWidget {
  const IslamicOccasionsScreen({super.key});

  @override
  State<IslamicOccasionsScreen> createState() => _IslamicOccasionsScreenState();
}

NotifiModel notifiModel = NotifiModel();
// NotifyHelper notifyHelper = NotifyHelper();

class _IslamicOccasionsScreenState extends State<IslamicOccasionsScreen> {
  int calucate(int year, int month, int day) {
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

  // int calculateDaysUntilSpecificDate(
  //     HijriCalendar today, int targetMonth, int targetDay) {
  //   int daysUntilEvent = 0;

  //   bool hasPassedThisYear = today.hMonth > targetMonth ||
  //       (today.hMonth == targetMonth && today.hDay >= targetDay);

  //   int currentMonth = today.hMonth;
  //   int currentYear = today.hYear;
  //   while (true) {
  //     HijriCalendar tempDate = HijriCalendar.now();
  //     tempDate.hYear = currentYear;
  //     tempDate.hMonth = currentMonth;

  //     if (currentMonth == targetMonth && !hasPassedThisYear) {
  //       daysUntilEvent += targetDay - today.hDay;
  //       break;
  //     } else {
  //       daysUntilEvent += (currentMonth == today.hMonth)
  //           ? tempDate.lengthOfMonth - today.hDay
  //           : tempDate.lengthOfMonth;

  //       if (currentMonth == 12) {
  //         currentMonth = 1;
  //         currentYear++;
  //       } else {
  //         currentMonth++;
  //       }
  //       if (currentYear > today.hYear && currentMonth == targetMonth) {
  //         daysUntilEvent += targetDay;
  //         break;
  //       }
  //     }
  //   }
  //   print("Days until specific date: $daysUntilEvent");
  //   return daysUntilEvent;
  // }

  List title = [
    'بداية السنة الهجرية',
    'رمضان',
    'عيد الفطر',
    'يوم عرفة',
    'عيد الأضحى'
  ];
  List month = [1, 9, 10, 12, 12];
  List days = [1, 1, 1, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المناسبات الإسلامية',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
          children: List.generate(
        5,
        (index) {
          int total =
              calucate(HijriCalendar.now().hYear, month[index], days[index]);
          return OccasionsWidget(
            title: title[index],
            total: total,
          );
        },
      )),
    );
  }
}

class OccasionsWidget extends StatelessWidget {
  const OccasionsWidget({
    super.key,
    required this.total,
    required this.title,
  });
  final int total;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: c5,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: c3.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              width: calculateProgress(85, total),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$total\nأيـــام',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double calculateProgress(int currentIndex, int total) {
    int totalPages = total;
    if (currentIndex < 1) {
      return 0.0;
    }
    if (currentIndex > totalPages) {
      return 100.0;
    }
    return (currentIndex / totalPages) * Get.width - 30;
  }
}
