import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/size_config.dart';

class CustomDetails extends StatelessWidget {
  const CustomDetails({super.key});

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
          height: getProportionateScreenWidth(120),
          padding: const EdgeInsets.only(right: 10, left: 0, bottom: 0, top: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Get.isDarkMode ? Colors.white24 : Colors.black26,
              ),
              gradient: LinearGradient(colors: [
                context.theme.colorScheme.onSecondary.withOpacity(0.5),
                context.theme.colorScheme.onSecondary.withOpacity(0.3),
                context.theme.colorScheme.onSecondary.withOpacity(0.1),
              ])),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مساك الله بالخير',
                    // overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                    ),
                  ),
                  Text(
                    '3 رجب | 1445 هـجري',
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
                  height: getProportionateScreenWidth(120),
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
