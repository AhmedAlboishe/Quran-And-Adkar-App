import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:quran/model/data_model.dart';
import 'package:quran/services/adkar_service.dart';
import 'package:quran/services/theme_services.dart';
import 'package:quran/ui/size_config.dart';
import 'package:quran/ui/widgets/custom_counter.dart';

import 'package:quran/ui/widgets/custom_deker.dart';
import 'package:quran/ui/widgets/custom_exit_button.dart';

class AdkarScreen extends StatefulWidget {
  const AdkarScreen({super.key, required this.title});
  final String title;
  @override
  State<AdkarScreen> createState() => _AdkarScreenState();
}

class _AdkarScreenState extends State<AdkarScreen>
    with AutomaticKeepAliveClientMixin {
  List adkar = [];
  int count = 0;
  final adkarServices = AdkarServices();
  bool disposes = false;
  int disappearedCount = 0;
  bool showExit = false;
  int totalAdkar = 0;
  void _countOnTap() {
    count++;
    adkarServices.saveAdkarNumberToStorage(totalAdkar: count + totalAdkar);
  }

  @override
  void initState() {
    totalAdkar = adkarServices.loadTotalAdkarFromStorage();
    adkar = DataModel.getAdkar(widget.title);
    super.initState();
  }

  void _onDekerDisappear() {
    log('_onDekerDisappear $disappearedCount');
    disappearedCount++;
    if (disappearedCount == adkar.length) {
      // تنفيذ الكود الذي تريده عند اختفاء جميع العناصر
      // _showOverlayMessage("تم اختفاء جميع العناصر");
      totalAdkar = adkarServices.loadTotalAdkarFromStorage();
      setState(() {});
      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) {
          setState(() {
            showExit = true;
          });
        }
      });
    }
  }

  bool isDarkMode = Get.isDarkMode;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // SizeConfig().init;
    return PopScope(
      canPop: showExit ? true : false,
      onPopInvoked: (didPop) {
        log('pop scope $didPop');
        totalAdkar = adkarServices.loadTotalAdkarFromStorage();
        setState(() {
          disposes = true;
        });
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() {
              showExit = true;
            });
          }
        });
        log('disposes $disposes');
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(fontSize: getProportionateScreenWidth(15)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: IconButton(
                  onPressed: () {
                    ThemeServices().switchThemeMode();
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                  },
                  icon: Icon(isDarkMode
                      ? CupertinoIcons.sun_max
                      : Icons.dark_mode_outlined)),
            )
          ],
        ),
        body: PageStorage(
            bucket: PageStorageBucket(),
            child: disappearedCount != adkar.length && disposes == false
                ? AnimationLimiter(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: adkar.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomDeker(
                            data: adkar[index],
                            onTapCount: _countOnTap,
                            onDisappear: _onDekerDisappear,
                          );
                        }),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CustomCounter(
                        title: 'عدد الأذكار التي قرأتها',
                        targetValue: count,
                      ),
                      CustomCounter(
                        title: 'مجموع الأذكار          ',
                        targetValue: totalAdkar,
                      ),
                      const Spacer(),
                      Visibility(
                        visible: showExit,
                        child: const CustomExitButton(),
                      ),
                      const Spacer(),
                    ],
                  )),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
