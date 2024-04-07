import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/adkar_model.dart';

class RepetitionWidgetTwo extends StatelessWidget {
  const RepetitionWidgetTwo({
    super.key,
    required this.count,
    required this.adkar,
  });

  final int count;
  final Adkar adkar;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 1, top: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: context.theme.colorScheme.onSecondary,
          ),
        ),
        child: Text(
          'التكرار: ${count == -1 ? adkar.repetition : count == 0 ? adkar.repetition - 1 : adkar.repetition - count - 1}',
          style: const TextStyle(fontFamily: 'Tajawal'),
        ));
  }
}
