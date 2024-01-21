import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quran/ui/theme.dart';
import 'package:share_plus/share_plus.dart';

class CustomNames extends StatelessWidget {
  const CustomNames({
    super.key,
    required this.data,
  });
  final Map data;
  @override
  Widget build(BuildContext context) {
    String meaning = data['meaning'].split(':')[1];

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
          // height: 150,
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
                meaning,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Parastoo'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: data['meaning']));
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
                      Share.share(data['meaning']);
                    },
                    child: Image.asset(
                      'assets/icons/share-2.png',
                      height: 26,
                      color: Get.isDarkMode ? darkTextClr : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
