import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/screens/home/widgets/buttons_bar.dart';

import '../../../size_config.dart';

class AyaWidget extends StatelessWidget {
  const AyaWidget({
    super.key,
    required this.subTitle,
    this.fontSize,
    this.textHight,
    required this.ayaInfo,
  });
  final String subTitle;
  final String ayaInfo;
  final double? fontSize;
  final double? textHight;
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
          color: context.theme.iconTheme.color!,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('آية من القرآن'),
              Text(ayaInfo),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'uthmani',
              fontSize: getProportionateScreenWidth(15),
              height: textHight,
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
