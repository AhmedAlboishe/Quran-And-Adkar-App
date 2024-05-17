import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onTap,
    required this.asset,
    required this.title,
  });

  final VoidCallback onTap;
  final String asset;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          // color: Colors.yellow,
          padding: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? context.theme.colorScheme.background
                : white.withOpacity(0.2),
            border: Border.all(
              color: context.theme.colorScheme.onSecondary.withOpacity(0.5),
              // color: context.iconColor!,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(),
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                asset,
                height: 26,
                color: Get.isDarkMode ? darkTextClr : black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
