import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:quran/ui/screens/adkar/controller/adkar_controller.dart';
import 'package:quran/services/theme_services.dart';
import 'package:quran/ui/size_config.dart';
import 'package:quran/ui/screens/adkar/widgets/custom_deker.dart';

import 'widgets/custom_counter.dart';
import 'widgets/custom_exit_button.dart';

class AdkarScreen extends StatelessWidget {
  AdkarScreen({super.key, required this.title});
  final String title;
  final AdkarController adkarCtrl = Get.put(AdkarController());

  @override
  Widget build(BuildContext context) {
    return GetX<AdkarController>(
      builder: (ctrl) => PopScope(
        canPop: ctrl.count.value == 0 || ctrl.showExitButton.value,
        onPopInvoked: (didPop) {
          if (ctrl.count.value != 0 && !ctrl.showExitButton.value) {
            log('disposes **1 ${ctrl.count.value != 0 || ctrl.showExitButton.value}');
            ctrl.showAdkarCalculator.value = true;
            Future.delayed(const Duration(milliseconds: 1200), () {
              ctrl.showExitButton.value = true;
            });
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _appBar(context),
          body: GetX<AdkarController>(
            builder: (adkarController) {
              print(
                  'rebuild ListView **** lentgh--->${adkarController.adkar.length}');
              if (adkarController.adkar.isEmpty) {
                adkarController.getAdkar(title);
                return const Center(
                  child: Text(
                    'لاتوجد أذكار\nقم بإضافة أذكار الآن',
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (!adkarController.allDekerDisappear.value &&
                  !adkarController.showAdkarCalculator.value) {
                return AnimationLimiter(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: adkarController.adkar.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomDeker(
                          adkar: adkarController.adkar[index],
                          index: index,
                        );
                      }),
                );
              }
              return Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CustomCounter(
                    title: 'عدد الأذكار التي قرأتها',
                    targetValue: adkarController.count.value,
                  ),
                  CustomCounter(
                    title: 'مجموع الأذكار          ',
                    targetValue: adkarController.totalAdkar.value,
                  ),
                  const Spacer(),
                  Visibility(
                    visible: adkarController.showExitButton.value,
                    child: const CustomExitButton(),
                  ),
                  const Spacer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: getProportionateScreenWidth(15)),
      ),
      actions: [
        Obx(
          () => Visibility(
            visible: !adkarCtrl.allDekerDisappear.value &&
                adkarCtrl.adkar.isNotEmpty &&
                !adkarCtrl.showAdkarCalculator.value,
            // disappearedCount != adkar.length && disposes == false,
            child: IconButton(
                onPressed: () {
                  adkarCtrl.showEdit.value = !adkarCtrl.showEdit.value;
                },
                icon: const Icon(Icons.edit)),
          ),
        ),
        Obx(
          () => Visibility(
            visible: !adkarCtrl.allDekerDisappear.value &&
                !adkarCtrl.showAdkarCalculator.value,
            child: IconButton(
                onPressed: () =>
                    adkarCtrl.addDeker(context: context, category: title),
                icon: const Icon(Icons.add)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {
              ThemeServices().switchThemeMode(); // issue
              adkarCtrl.isDarkMode.value = !adkarCtrl.isDarkMode.value;
            },
            icon: Obx(
              () => Icon(
                adkarCtrl.isDarkMode.value
                    ? CupertinoIcons.sun_max
                    : Icons.dark_mode_outlined,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
