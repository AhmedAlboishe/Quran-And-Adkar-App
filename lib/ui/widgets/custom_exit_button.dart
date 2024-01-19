import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:quran/ui/size_config.dart';

class CustomExitButton extends StatelessWidget {
  const CustomExitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: getProportionateScreenHeight(200),
            left: getProportionateScreenWidth(140),
            right: getProportionateScreenWidth(140)),
        child: AnimationConfiguration.synchronized(
          child: FadeInAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(milliseconds: 2500),
            child: TextButton(
              child: Text(
                'الخروج',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ));
  }
}
