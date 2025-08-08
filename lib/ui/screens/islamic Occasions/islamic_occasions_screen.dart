import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quran/ui/screens/notifications/model/notification_model.dart';
import 'package:quran/ui/size_config.dart';

import 'widgets/occasion_widget.dart';

class IslamicOccasionsScreen extends StatefulWidget {
  const IslamicOccasionsScreen({super.key});

  @override
  State<IslamicOccasionsScreen> createState() => _IslamicOccasionsScreenState();
}

NotifiModel notifiModel = NotifiModel();
// NotifyHelper notifyHelper = NotifyHelper();

class _IslamicOccasionsScreenState extends State<IslamicOccasionsScreen> {
  final HijriCalendar hijriCalendar = HijriCalendar.now();
// final List<int> months = [
//       9,
//       10,
//       12,
//       12,
//       1,
//     ];
//     final List<int> days = [
//       1,
//       1,
//       9,
//       10,
//       1,
//     ];
//     final List<int> years = [
//       hijriCalendar.hYear,
//       hijriCalendar.hYear + 1,
//     ];
  List title = [
    'بداية السنة الهجرية',
    'رمضان',
    'عيد الفطر',
    'يوم عرفة',
    'عيد الأضحى'
  ];

  List months = [1, 9, 10, 12, 12];
  List days = [1, 1, 1, 9, 10];
  @override
  Widget build(BuildContext context) {
    final List<int> years = [
      hijriCalendar.hYear,
      hijriCalendar.hYear + 1,
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'المناسبات الإسلامية',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.w700),
          ),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 11,
          itemBuilder: (context, index) {
            int dis = index % months.length;
            if (index == 5) {
              return Column(
                children: [
                  Divider(
                    indent: 80,
                    endIndent: 80,
                    color: context.theme.iconTheme.color!,
                  ),
                  Center(
                      child: Text(
                    'السنة الهجرية ${years[1]}',
                    style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                  )),
                  Divider(
                    indent: 80,
                    endIndent: 80,
                    color: context.theme.iconTheme.color!,
                  ),
                ],
              );
            } else {
              if (index > 5) {
                int dis = (index - 1) % months.length;
                return OccasionWidget(
                  occasionTitle: title[dis],
                  year: years[index - 1 <= months.length - 1 ? 0 : 1],
                  month: months[dis],
                  day: days[dis],
                  isLastOne: index == 10,
                );
              } else {
                return OccasionWidget(
                  occasionTitle: title[dis],
                  year: years[index <= months.length - 1 ? 0 : 1],
                  month: months[dis],
                  day: days[dis],
                );
              }
            }

            // OccasionsWidget(
            //   title: title[index],
            //   total: total,
            // );
          },
        ));
  }
}
