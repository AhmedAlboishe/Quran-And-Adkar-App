import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quran/ui/size_config.dart';

class CustomDetails extends StatelessWidget {
  const CustomDetails({super.key});
  String getDate() {
    HijriCalendar.setLocal('ar');
    HijriCalendar today = HijriCalendar.now();

    return '${today.dayWeName}، ${today.hDay} ${today.longMonthName}\n${today.hYear} هـ\n';
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: PhysicalModel(
        color: context.theme.colorScheme.background,
        shadowColor: Get.isDarkMode
            ? const Color.fromARGB(255, 100, 100, 100)
            : const Color(0xFF000000),
        elevation: 4,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: getProportionateScreenWidth(140),
          padding: const EdgeInsets.only(right: 10, left: 0, bottom: 0, top: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Get.isDarkMode ? Colors.white24 : Colors.black26,
              ),
              gradient: LinearGradient(colors: [
                context.theme.colorScheme.onSecondary.withOpacity(0.5),
                context.theme.colorScheme.onSecondary.withOpacity(0.3),
                context.theme.colorScheme.onSecondary.withOpacity(0.2),
              ])),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateTime.now().hour < 12
                        ? 'صبحك الله بالخير'
                        : 'مساك الله بالخير',
                    // overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                    ),
                  ),
                  Text(
                    getDate(),
                    // overflow: TextOverflow.visible,
                    style: TextStyle(fontSize: getProportionateScreenWidth(11)),
                  ),
                ],
              ),
              const Spacer(),
              ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(14)),
                child: Image.asset(
                  'assets/images/image 22.png',
                  height: getProportionateScreenWidth(140),
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
