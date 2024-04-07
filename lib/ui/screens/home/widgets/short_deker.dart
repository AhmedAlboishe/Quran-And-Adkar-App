import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/screens/adkar/adkar_screen.dart';
import 'package:quran/ui/size_config.dart';

class ShortDeker extends StatelessWidget {
  const ShortDeker({
    super.key,
    required this.title,
    required this.assets,
  });
  final String title;
  final String assets;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Expanded(
      child: InkWell(
        onTap: () {
          Get.to(
            () => AdkarScreen(title: title),
            transition: Transition.fade,
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: getProportionateScreenWidth(100),
          // padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: darkPrimaryClr.withOpacity(0.5),
            color: context.theme.colorScheme.background,
            border: Border.all(
              // color: context.theme.colorScheme.onSecondary,
              color: context.theme.iconTheme.color!,
              // width: 2,
            ),

            boxShadow: [
              BoxShadow(
                color: Get.isDarkMode
                    ? const Color(0x2F646464)
                    : const Color(0x29000000),
                offset: const Offset(0, 2),
                blurRadius: 5,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: context.theme.iconTheme.color!.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  assets,
                  height: 40,
                  color: context.theme.iconTheme.color!,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(15),
                  // color: Colors.white,
                  // shadows: const [BoxShadow(offset: Offset(0, 1))],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
