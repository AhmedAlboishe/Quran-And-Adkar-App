import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/adkar_model.dart';

class RepetitionWidget extends StatelessWidget {
  const RepetitionWidget({
    super.key,
    required this.adkar,
    required this.count,
  });

  final Adkar adkar;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(adkar.repetition, (index) {
        return Expanded(
          child: AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn, //fastOutSlowIn,
            duration: const Duration(milliseconds: 800),
            margin:
                const EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 15),
            height: 10,
            decoration: BoxDecoration(
              color: count >= index
                  ? context.theme.colorScheme.onSecondary
                  : context.theme.colorScheme.onSecondary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      }),
    );
  }
}
