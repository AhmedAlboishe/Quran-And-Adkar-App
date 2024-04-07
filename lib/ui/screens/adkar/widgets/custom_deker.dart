import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/screens/adkar/controller/adkar_controller.dart';
import 'package:quran/ui/screens/adkar/model/adkar_model.dart';
import 'package:quran/ui/screens/adkar/widgets/animation_widget.dart';
import 'package:quran/ui/screens/adkar/widgets/editing_deker_widget.dart';
import 'package:quran/ui/screens/adkar/widgets/repetition_widget.dart';
import 'package:quran/ui/screens/adkar/widgets/repetition_widget_two.dart';
import 'package:vibration/vibration.dart';

class CustomDeker extends StatelessWidget {
  CustomDeker({
    super.key,
    required this.adkar,
    required this.index,
  });
  final Adkar adkar;
  final int index;
  final TextEditingController dekerController = TextEditingController();
  final TextEditingController repetitionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    dekerController.text = adkar.deker;
    repetitionController.text = adkar.repetition.toString();

    return GetX<AdkarController>(
      builder: (controller) => AnimationWidget(
        child: controller.counter[index] < adkar.repetition - 1
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                child: PhysicalModel(
                  color: context.theme.colorScheme.background,
                  shadowColor:
                      context.theme.colorScheme.onSecondary.withOpacity(0.5),
                  elevation: 4,
                  borderRadius: BorderRadius.circular(15),
                  child: GestureDetector(
                    onTap: () async {
                      if (await Vibration.hasVibrator() == true) {
                        log('Vibration -->True');
                        Vibration.vibrate(duration: 30);
                      }
                      controller.countOnTap(
                          index: index, c: controller.counter[index]);
                      if (controller.counter[index] >= adkar.repetition - 1) {
                        controller.onDekerDisappear();
                        log('onDisappear');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          right: 15, left: 15, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color:
                              Get.isDarkMode ? Colors.white24 : Colors.black26,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            adkar.deker,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                height: 1.8, fontFamily: 'Parastoo'),
                          ),
                          adkar.repetition < 7
                              ? RepetitionWidget(
                                  adkar: adkar,
                                  count: controller.counter[index])
                              : RepetitionWidgetTwo(
                                  count: controller.counter[index],
                                  adkar: adkar),
                          // controller
                          EditingDekerWidget(
                              dekerIndex: index,
                              adkarController: controller,
                              formKey: formKey,
                              dekerController: dekerController,
                              repetitionController: repetitionController,
                              adkar: adkar),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
   // if (true) {
                      //   print(await Vibration.deviceInfo.androidInfo
                      //     ..fingerprint);
                      // }