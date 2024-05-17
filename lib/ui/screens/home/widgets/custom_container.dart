import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/screens/home/widgets/buttons_bar.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.subTitle,
    required this.title,
  });
  final String subTitle;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
        // color: Get.isDarkMode ? c2.withOpacity(0.1) : c2.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          // color: context.theme.iconTheme.color!,
          color: context.theme.colorScheme.onSecondary.withOpacity(0.5),

          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              // height: textHight,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonsBar(subTitle: subTitle),
        ],
      ),
    );
  }
}
