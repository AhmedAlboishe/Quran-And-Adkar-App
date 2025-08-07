import 'package:flutter/material.dart';
import 'package:quran/ui/size_config.dart';

import 'widgets/last_read.dart';
import 'widgets/surah.dart';

class SurasScreen extends StatelessWidget {
  const SurasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'القرآن الكريم',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.w700),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const LastRead(),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: List.generate(114, (index) {
                return Surah(
                  surahIndex: index,
                );
              }),
            ),
          ],
        ));
  }
}
