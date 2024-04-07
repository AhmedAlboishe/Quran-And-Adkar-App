import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quran/ui/theme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

class CustomPraise extends StatefulWidget {
  const CustomPraise({
    super.key,
    required this.titel,
  });
  final String titel;
  @override
  State<CustomPraise> createState() => _CustomPraiseState();
}

class _CustomPraiseState extends State<CustomPraise>
    with AutomaticKeepAliveClientMixin {
  int count = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: PhysicalModel(
        color: context.theme.colorScheme.background,
        shadowColor: Get.isDarkMode
            ? const Color.fromARGB(255, 100, 100, 100)
            : const Color(0xFF000000),
        elevation: 4,
        borderRadius: BorderRadius.circular(15),
        child: GestureDetector(
          onTap: () {
            if (count < 2) {
              Vibration.vibrate(duration: 30);
            }
            setState(() {
              count++;
            });
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
            decoration: BoxDecoration(
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
                    Text('تسبيح'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.titel,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontFamily: 'Parastoo'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: List.generate(3, (index) {
                      return Expanded(
                        child: AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn, //fastOutSlowIn,
                          duration: const Duration(milliseconds: 800),
                          margin: const EdgeInsets.only(
                              left: 8, right: 8, top: 20, bottom: 25),
                          height: 10,
                          decoration: BoxDecoration(
                            color: count >= index
                                ? context.theme.colorScheme.onSecondary
                                : context.theme.colorScheme.onSecondary
                                    .withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: widget.titel));
                        Fluttertoast.showToast(
                            msg: 'تم النسخ',
                            backgroundColor: const Color(0xFF616161));
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
                        Share.share(widget.titel);
                      },
                      child: Image.asset(
                        'assets/icons/share-2.png',
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
                      onTap: count >= 2
                          ? () {
                              setState(() {
                                count = -1;
                              });
                            }
                          : () {},
                      child: Image.asset(
                        'assets/icons/refresh-ccw.png',
                        height: 26,
                        color: Get.isDarkMode
                            ? count >= 2
                                ? darkTextClr
                                : Colors.grey
                            : count >= 2
                                ? Colors.black
                                : Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
