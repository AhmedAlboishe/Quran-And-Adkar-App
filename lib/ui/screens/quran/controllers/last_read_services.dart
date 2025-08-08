import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran_library/quran.dart';

class LastReadService extends GetxService {
  final GetStorage _getStorage = GetStorage();
  RxInt lastPageRead = 1.obs;
  RxInt lastSuraNumRead = 1.obs;

  void _setLastRead(int page, int suraNum) {
    lastPageRead = page.obs;
    lastSuraNumRead.value = suraNum;
    _getStorage.write("lastRead", page);
    _getStorage.write("lastSuraNumRead", suraNum);
  }

  void updateLastRead(AyahModel firstAya) {
    log('updateLastRead: ${firstAya.page} - ${firstAya.surahNumber}');
    _setLastRead(
      firstAya.page,
      QuranLibrary()
          .getCurrentSurahDataByPageNumber(pageNumber: firstAya.page)
          .surahNumber,
    );
  }

  Future<LastReadService> init() async {
    lastPageRead.value = _getStorage.read("lastRead") ?? 1;
    lastSuraNumRead.value = _getStorage.read("lastSuraNumRead") ?? 1;

    return this;
  }
}
