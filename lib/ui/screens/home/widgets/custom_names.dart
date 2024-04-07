import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/screens/home/widgets/buttons_bar.dart';


class CustomNames extends StatelessWidget {
  const CustomNames({
    super.key,
    required this.data,
  });
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Row(
            children: [
              Text('أسماء الله الحسنى'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Transform.scale(
            scale: data['name'] == '[' ? 6 : 4,
            child: Text(
              data['name'],
              // textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily:
                    Get.isDarkMode ? 'Tashkeel-white' : 'Tashkeel-black',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            data['meaning'].split(':')[1],
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: 'Parastoo'),
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonsBar(
            subTitle: data['meaning'],
          ),
        ],
      ),
    );
  }
}
