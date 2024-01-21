import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quran/ui/theme.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:share_plus/share_plus.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.subTitle,
    required this.title,
    this.fontFamily = 'Parastoo',
    this.fontSize,
    this.textHight,
  });
  final String subTitle;
  final String title;
  final String fontFamily;
  final double? fontSize;
  final double? textHight;
  @override
  Widget build(BuildContext context) {
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
          // height: 80,
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Get.isDarkMode ? Colors.white24 : Colors.black26,
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
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: fontSize,
                  height: textHight,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: subTitle));
                      Fluttertoast.showToast(msg: 'تم النسخ');
                    },
                    child: Image.asset(
                      'assets/icons/clipboard.png',
                      height: 26,
                      color: Get.isDarkMode ? darkTextClr : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                    child: VerticalDivider(
                        // color: Colors.amber,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(subTitle);
                    },
                    child: Image.asset(
                      'assets/icons/share-2.png',
                      height: 26,
                      color: Get.isDarkMode ? darkTextClr : Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
