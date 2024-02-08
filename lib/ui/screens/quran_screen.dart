import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/size_config.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? const Color(0xFFF8FAE5) : const Color(0xfffff8ee),
      // appBar: AppBar(
      //   title: Text(
      //     'القرآن الكريم',
      //     style: TextStyle(
      //         fontSize: getProportionateScreenWidth(15),
      //         fontWeight: FontWeight.w700),
      //   ),
      // ),
      body: Center(
          child: Text(
        'قريباً',
        style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            fontWeight: FontWeight.w700),
      )),
    );
  }
}
