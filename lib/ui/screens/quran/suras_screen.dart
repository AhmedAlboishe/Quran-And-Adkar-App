import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran/core/helper/arabic_number.dart';
import 'package:quran/ui/screens/quran/controllers/quran_controller.dart';
import 'package:quran/ui/screens/quran/quran_screen.dart';
import 'package:quran/ui/size_config.dart';

class SurasScreen extends StatelessWidget {
  const SurasScreen({super.key});

  final List suras = const [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor:
        //     Get.isDarkMode ? const Color(0xFFF8FAE5) : const Color(0xfffff8ee),
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
            const SearchBar(),
            const LastRead(),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: List.generate(suras.length, (index) {
                return Sura(
                  number: index + 1,
                  suraName: suras[index],
                );
              }),
            ),
          ],
        ));
  }
}

class Sura extends StatelessWidget {
  Sura({
    super.key,
    required this.suraName,
    required this.number,
  });
  final String suraName;
  final int number;
  QuranController quranCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => QuranScreen(
              page: quranCtrl.surahs[number - 1].ayahs[0].page - 1,
              name: suraName,
            ));
      },
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        // margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: number % 2 == 1
                ? context.theme.colorScheme.background
                : context.theme.iconTheme.color!.withOpacity(0.1),
            image: const DecorationImage(image: AssetImage(''))
            // borderRadius: BorderRadius.circular(15),
            // border: Border.all(
            //   color: context.theme.iconTheme.color!,
            // ),
            // border: BorderDirectional(
            //     bottom: BorderSide(
            //   color: context.theme.iconTheme.color!,
            // )),
            // boxShadow: [
            //   BoxShadow(
            //     color: Get.isDarkMode
            //         ? const Color(0x2F646464)
            //         : const Color(0x29000000),
            //     offset: const Offset(0, 2),
            //     blurRadius: 5,
            //   ),
            // ],
            ),
        child: Row(
          children: [
            // const Icon(
            //   Icons.numbers_rounded,
            //   size: 35,
            // ),

            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/surah_name/Vector.svg',
                  height: getProportionateScreenWidth(40),
                ),
                Text(
                  number.toArabic(),
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
            // SvgPicture.asset(
            //   'assets/surah_name/00$number.svg',
            //   height: getProportionateScreenWidth(40),
            //   colorFilter: ColorFilter.mode(
            //     context.theme.colorScheme.onBackground,
            //     BlendMode.srcIn,
            //   ),
            // ),
            Text(
              suraName,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(22),
                fontFamily: 'SuraNames',
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 100,
              child: Text(
                '${quranCtrl.surahs[number - 1].revelationType == 'Medinan' ? 'مدنية' : 'مكية'} | ${quranCtrl.surahs[number - 1].ayahs.length} آية\nصفحة: ${quranCtrl.surahs[number - 1].ayahs[0].page}',
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

class LastRead extends StatelessWidget {
  const LastRead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: context.theme.iconTheme.color!,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'أخــر قــــراءة',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.w700,
            ),
          ),
          // const SizedBox(
          //   height: 15,
          // ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'سورة يوسف\nأية 15',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                    ),
                  ),
                  // const Spacer(),
                  Column(
                    children: [
                      const Icon(
                        Icons.bookmark_added_outlined,
                        size: 50,
                      ),
                      Text(
                        'صفحة 237',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: context.theme.iconTheme.color!,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Get.isDarkMode
        //         ? const Color(0x2F646464)
        //         : const Color(0x29000000),
        //     offset: const Offset(0, 2),
        //     blurRadius: 5,
        //   )
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'بحث عن سورة',
            style: TextStyle(
                color: context.theme.colorScheme.onBackground.withOpacity(0.5)),
          ),
          const Icon(
            Icons.search,
          ),
        ],
      ),
    );
  }
}
