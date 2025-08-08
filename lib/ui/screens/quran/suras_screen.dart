import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:quran/ui/size_config.dart';
import 'package:quran_library/quran.dart';

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
            Obx(() => LastRead(
                  pageNumber: QuranLibrary().quranCtrl.lastPage.obs.value,
                )),
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
