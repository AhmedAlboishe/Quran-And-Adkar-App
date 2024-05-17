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
                // color: context.theme.iconTheme.color!,
                color: context.theme.colorScheme.onSecondary.withOpacity(0.5),
                width: 1.5),
            // color: Get.isDarkMode ? c2.withOpacity(0.2) : null,
            // gradient: LinearGradient(colors: [
            //   context.theme.iconTheme.color!.withOpacity(0.5),
            //   context.theme.iconTheme.color!.withOpacity(0.4),
            //   context.theme.iconTheme.color!.withOpacity(0.3),
            // ]),
            // gradient: LinearGradient(
            //   colors: [
            //     // context.theme.colorScheme.onSecondary.withOpacity(0.5),

            //     // const Color.fromARGB(255, 0, 66, 120).withOpacity(0.3),
            //     // context.theme.colorScheme.onSecondary.withOpacity(0.5),
            //     // const Color(0xFFB19470).withOpacity(0.6),
            //     // const Color(0xFFB19470).withOpacity(0.5),
            //     const Color(0xFFB19470).withOpacity(0.25),
            //     const Color(0xFFB19470).withOpacity(0.2),
            //     const Color(0xFFB19470).withOpacity(0.15),
            //     const Color(0xFFB19470).withOpacity(0.1),
            //     // const Color(0xFFB19470).withOpacity(0.2),
            //   ],
            //   begin: Alignment.bottomLeft,
            // ),
          ),
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
                      fontSize: getProportionateScreenWidth(14),
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
                  'assets/images/image22.png',
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
