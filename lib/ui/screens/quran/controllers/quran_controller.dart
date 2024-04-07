import 'dart:convert';
import 'dart:developer';

// import 'package:bot_toast/bot_toast.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

import 'package:flutter_svg/svg.dart';
import 'package:quran/ui/theme.dart';

import '../models/ayaat_model.dart';
import '../../../size_config.dart';

class QuranController extends GetxController {
  List<Surah> surahs = [];
  List<List<Ayah>> pages = [];
  List<Ayah> allAyahs = [];

  var selectedAyahIndexes = <int>[].obs;
  bool isSelected = false;
  final ScrollController scrollIndicatorController = ScrollController();
  RxInt selectedIndicatorIndex = 0.obs;
  // PreferDirection preferDirection = PreferDirection.topCenter;
  RxDouble textWidgetPosition = (-240.0).obs;
  RxBool isPlayExpanded = false.obs;
  List<int> lastPlace = [
    75,
    206,
    330,
    340,
    348,
    365,
    375,
    413,
    415,
    434,
    450,
    496,
    504,
    523,
    546,
    554,
    556,
    583
  ];
  // RxInt currentPage = 1.obs;

  // final generalCtrl = sl<GeneralController>();
  // final themeCtrl = sl<ThemeController>();

  @override
  void onInit() async {
    super.onInit();
    await loadQuran();
  }

  Widget surahBannerWidget(String number) {
    return bannerWithSurahName(surahBanner1(), number);
  }

  Widget surahNameWidget(String num, Color color) {
    return SizedBox(
      height: 50,
      child: SvgPicture.asset(
        'assets/svg/surah_name/00$num.svg',
        height: getProportionateScreenWidth(40),
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }

  void toggleAyahSelection(int index) {
    if (selectedAyahIndexes.contains(index)) {
      selectedAyahIndexes.remove(index);
    } else {
      selectedAyahIndexes.clear();
      selectedAyahIndexes.add(index);
      selectedAyahIndexes.refresh();
    }
    selectedAyahIndexes.refresh();
  }

  void clearSelection() {
    if (selectedAyahIndexes.isNotEmpty) {
      selectedAyahIndexes.clear();
    } else {
      // sl<GeneralController>().showControl();
    }
  }

  Future<void> loadQuran() async {
    String jsonString = await rootBundle.loadString('assets/json/quranV2.json');
    Map<String, dynamic> jsonResponse = jsonDecode(jsonString);
    List<dynamic> surahsJson = jsonResponse['data']['surahs'];
    surahs = surahsJson.map((s) => Surah.fromJson(s)).toList();

    for (final surah in surahs) {
      allAyahs.addAll(surah.ayahs);
      log('Added ${surah.arabicName} ayahs');
      update();
    }
    List.generate(604, (pageIndex) {
      pages.add(allAyahs.where((ayah) => ayah.page == pageIndex + 1).toList());
    });
    log('Pages Length: ${pages.length}', name: 'Quran Controller');
  }

  List<List<Ayah>> getCurrentPageAyahsSeparatedForBasmala(int pageIndex) =>
      pages[pageIndex]
          .splitBetween((f, s) => f.ayahNumber > s.ayahNumber)
          .toList();

  List<Ayah> getCurrentPageAyahs(int pageIndex) => pages[pageIndex];

  /// will return the surah number of the first ayahs..
  /// even if the page contains another surah..
  /// if you wanna get the last's ayah's surah information
  /// you can use [ayahs.last].
  int getSurahNumberFromPage(int pageNumber) => surahs
      .firstWhere(
          (s) => s.ayahs.contains(getCurrentPageAyahs(pageNumber).first))
      .surahNumber;

  int getSurahNameFromPage(int pageNumber) {
    try {
      return surahs
          .firstWhere(
              (s) => s.ayahs.contains(getCurrentPageAyahs(pageNumber).first))
          .surahNumber;
    } catch (e) {
      // Handle the error or return a default/fallback value
      return 0; // Or any other fallback logic you prefer
    }
  }

  Widget bannerWithSurahName(Widget child, String number) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        surahNameWidget(number, black),
      ],
    );
  }

  int getSurahNumberByAyah(Ayah ayah) =>
      surahs.firstWhere((s) => s.ayahs.contains(ayah)).surahNumber;
}
// void indicatorOnTap(int pageNumber, int itemWidth, double screenWidth) {
//   // sl<GeneralController>().currentPage.value = pageNumber;
//   selectedIndicatorIndex.value = pageNumber;
//   final targetOffset =
//       itemWidth * pageNumber - (screenWidth * .69 / 2) + itemWidth / 2;
//   scrollIndicatorController.animateTo(
//     targetOffset,
//     duration: const Duration(milliseconds: 500),
//     curve: Curves.easeIn,
//   );
//   generalCtrl.quranPageController.animateToPage(
//     pageNumber,
//     duration: const Duration(milliseconds: 500),
//     curve: Curves.easeIn,
//   );
// }

// void indicatorScroll(BuildContext context) {
//   final screenWidth = MediaQuery.of(context).size.width;
//   final itemWidth = 80;
//   selectedIndicatorIndex.value = sl<GeneralController>().currentPage.value;
//   if (scrollIndicatorController.hasClients) {
//     final targetOffset =
//         itemWidth * sl<GeneralController>().currentPage.value -
//             (screenWidth * .69 / 2) +
//             itemWidth / 2;
//     scrollIndicatorController.animateTo(
//       targetOffset,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeIn,
//     );
//   } else {
//     // Handle the case where the scroll view is not ready
//   }
// }

// // Widget surahBannerWidget(String number) {
//   if (themeCtrl.isBlueMode) {
//     return bannerWithSurahName(surah_banner1(), number);
//   } else if (themeCtrl.isBrownMode) {
//     return bannerWithSurahName(surah_banner2(), number);
//   } else {
//     return bannerWithSurahName(surah_banner3(), number);
//   }
// }

Widget surahBanner1({double? height, double? width}) {
  return SvgPicture.asset(
    Get.isDarkMode ? 'assets/svg/banner_night.svg' : 'assets/svg/banner.svg',
    width: getProportionateScreenWidth(310),
  );
  // return Image.asset(
  //   'assets/svg/soura_header.png',
  //   width: getProportionateScreenWidth(400),
  //   color: c3,
  //   colorBlendMode: BlendMode.color,
  // );
  //assets\svg\soura_header.png
}

Widget besmAllah() {
  return SvgPicture.asset(
    'assets/svg/besmAllah.svg',
    width: 220,
    colorFilter:
        ColorFilter.mode(Get.isDarkMode ? darkTextClr : black, BlendMode.srcIn),
  );
}

Widget besmAllah2() {
  return SvgPicture.asset(
    'assets/svg/besmAllah2.svg',
    width: 220,
    colorFilter:
        ColorFilter.mode(Get.isDarkMode ? darkTextClr : black, BlendMode.srcIn),
  );
}
