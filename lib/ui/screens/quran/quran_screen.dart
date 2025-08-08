import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/theme.dart';
import 'package:quran_library/quran.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(useMaterial3: false),
      child: QuranLibraryScreen(
        // onPageChanged: (pageNumber) {
        //   LastReadService().updateLastRead(
        //     QuranLibrary().quranCtrl.getAyahsByPage(pageNumber).first,
        //   );
        // },
        pageIndex: 55,
        isDark: Get.isDarkMode,
        bannerStyle: BannerStyle(
          bannerSvgPath: Get.isDarkMode
              ? 'assets/svg/banner_night.svg'
              : 'assets/svg/banner.svg',
        ),
        surahNameStyle: SurahNameStyle(
          surahNameColor: Get.isDarkMode ? const Color(0xFF121212) : null,
        ),
        downloadFontsDialogStyle: DownloadFontsDialogStyle(
          dividerColor: c3,
          linearProgressBackgroundColor: c3.withValues(alpha: .2),
          linearProgressColor: c2,
          downloadButtonBackgroundColor: Get.isDarkMode ? c2 : c3,
          iconColor: Get.isDarkMode ? c2 : c3,
        ),
      ),
    );
  }
}
