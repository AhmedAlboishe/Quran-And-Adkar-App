import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

class CustomDeker extends StatefulWidget {
  const CustomDeker({
    super.key,
    required this.data,
    required this.onDisappear,
  });
  final Map data;
  final Function onDisappear;
  @override
  State<CustomDeker> createState() => _CustomDekerState();
}

class _CustomDekerState extends State<CustomDeker>
    with AutomaticKeepAliveClientMixin {
  int count = -1;
  late int times;
  late String deker;
  @override
  void initState() {
    deker = widget.data['deker'];
    times = widget.data['times'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimationConfiguration.staggeredList(
      position: 0,
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2000),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FadeInAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 2500),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeOutExpo,
            child: count < times - 1
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: PhysicalModel(
                      color: context.theme.colorScheme.background,
                      shadowColor: Get.isDarkMode
                          ? const Color.fromARGB(255, 100, 100, 100)
                          : const Color(0xFF000000),
                      elevation: 4,
                      borderRadius: BorderRadius.circular(15),
                      child: GestureDetector(
                        onTap: () {
                          if (count < times - 1) {
                            Vibration.vibrate(duration: 30);
                          }
                          setState(() {
                            count++;
                          });
                          if (count >= times - 1) {
                            widget.onDisappear();
                            log('onDisappear');
                          }
                        },
                        child: Container(
                          // height: 80,
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Get.isDarkMode
                                  ? Colors.white24
                                  : Colors.black26,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ],
                              ),
                              // const SizedBox(
                              //   height: 5,
                              // ),
                              Text(
                                deker,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    height: 1.8, fontFamily: 'Rubik'),
                              ),
                              Row(
                                children: List.generate(times, (index) {
                                  return Expanded(
                                    child: AnimatedContainer(
                                      curve: Curves
                                          .fastLinearToSlowEaseIn, //fastOutSlowIn,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      margin: EdgeInsets.only(
                                          left: times <= 3 ? 8 : 5,
                                          right: times <= 3 ? 8 : 5,
                                          top: 20,
                                          bottom: 15),
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: count >= index
                                            ? context
                                                .theme.colorScheme.onSecondary
                                            : context
                                                .theme.colorScheme.onSecondary
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
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
