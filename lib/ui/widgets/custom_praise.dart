import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            // height: 80,
            padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
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
                    const Text('تسبيح'),
                    const Spacer(),
                    Visibility(
                      visible: count >= 2,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            count = -1;
                          });
                        },
                        icon: const Icon(
                          CupertinoIcons.repeat,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.copy,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.titel,
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: List.generate(3, (index) {
                    return Expanded(
                      child: AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn, //fastOutSlowIn,
                        duration: const Duration(milliseconds: 800),
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, top: 20, bottom: 15),
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
