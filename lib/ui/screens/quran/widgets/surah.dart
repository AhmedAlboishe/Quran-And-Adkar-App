import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quran/core/helper/arabic_number.dart';
import 'package:quran_library/quran.dart';

import '../../../size_config.dart';
import '../quran_screen.dart';

class Surah extends StatelessWidget {
  final List surahsNames = const [
    'ﭑ',
    'ﭒ',
    'ﭓ',
    'ﭔ',
    'ﭕ',
    'ﭖ',
    'ﭗ',
    'ﭘ',
    'ﭙ',
    'ﭚ',
    'ﭛ',
    'ﭜ',
    'ﭝ',
    'ﭞ',
    'ﭟ',
    'ﭠ',
    'ﭡ',
    'ﭢ',
    'ﭣ',
    'ﭤ',
    'ﭥ',
    'ﭦ',
    'ﭧ',
    'ﭨ',
    'ﭩ',
    'ﭪ',
    'ﭫ',
    'ﭬ',
    'ﭭ',
    'ﭮ',
    'ﭯ',
    'ﭰ',
    'ﭱ',
    'ﭲ',
    'ﭳ',
    'ﭴ',
    'ﭵ',
    'ﭶ',
    'ﭷ',
    'ﭸ',
    'ﭹ',
    'ﭺ',
    'ﭻ',
    'ﭼ',
    'ﭽ',
    'ﭾ',
    'ﭿ',
    'ﮀ',
    'ﮁ',
    'ﮂ',
    'ﮃ',
    'ﮄ',
    'ﮅ',
    'ﮆ',
    'ﮇ',
    'ﮈ',
    'ﮉ',
    'ﮊ',
    'ﮋ',
    'ﮌ',
    'ﮍ',
    'ﮎ',
    'ﮏ',
    'ﮐ',
    'ﮑ',
    'ﮒ',
    'ﮓ',
    'ﮔ',
    'ﮕ',
    'ﮖ',
    'ﮗ',
    'ﮘ',
    'ﮙ',
    'ﮚ',
    'ﮛ',
    'ﮜ',
    'ﮝ',
    'ﮞ',
    'ﮟ',
    'ﮠ',
    'ﮡ',
    'ﮢ',
    'ﮣ',
    'ﮤ',
    'ﮥ',
    'ﮦ',
    'ﮧ',
    'ﮨ',
    'ﮩ',
    'ﮪ',
    'ﮫ',
    'ﮬ',
    'ﮭ',
    'ﮮ',
    'ﮯ',
    'ﮰ',
    'ﮱ',
    'ﯓ',
    'ﯔ',
    'ﯕ',
    'ﯖ',
    'ﯗ',
    'ﯘ',
    'ﯙ',
    'ﯚ',
    'ﯛ',
    'ﯜ',
    'ﯝ',
    'ﯞ',
    'ﯟ',
    'ﯠ',
    'ﯡ',
    'ﯢ',
    'ﯣ',
  ];

  const Surah({
    super.key,
    required this.surahIndex,
  });
  final int surahIndex;

  @override
  Widget build(BuildContext context) {
    // QuranController quranCtrl = Get.find();
    return InkWell(
      onTap: () {
        // QuranCtrl.instance.state.currentPageNumber.value = 50;
        Get.to(() => const QuranScreen());
        Future.delayed(const Duration(milliseconds: 10), () {
          QuranLibrary().jumpToSurah(surahIndex + 1);
        });
      },
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        // margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: surahIndex % 2 == 0
              ? context.theme.colorScheme.surface
              : context.theme.iconTheme.color!.withValues(alpha: 0.1),
        ),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/surah_name/Vector.svg',
                  height: getProportionateScreenWidth(40),
                ),
                Text(
                  (1 + surahIndex).toArabic(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              surahsNames[surahIndex],
              style: TextStyle(
                fontSize: getProportionateScreenWidth(22),
                fontFamily: 'SuraNames',
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 100,
              child: Text(
                '${QuranLibrary().getSurahInfo(surahNumber: surahIndex).revelationType} | ${QuranLibrary().getSurahInfo(surahNumber: surahIndex).ayahsNumber} ${QuranLibrary().getSurahInfo(surahNumber: surahIndex).ayahsNumber < 10 ? 'آيات' : 'آية'}\nصفحة: ${QuranLibrary().quranCtrl.surahs[surahIndex].ayahs.first.page}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    // fontSize: 17,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
