import 'package:get/get.dart';
import 'package:quran_library/quran.dart';

class QuranController extends GetxController {
  RxInt lastPage = 1.obs;
  RxString surahName = ''.obs;

  @override
  onInit() {
    super.onInit();
    getLastReadInfo();
  }

  getLastReadInfo() {
    getLastPage();
    getSurahName();
  }

  getLastPage() {
    lastPage.value = QuranLibrary().quranCtrl.lastPage;
  }

  getSurahName() {
    surahName.value = QuranLibrary()
        .getCurrentSurahDataByPageNumber(
            pageNumber: QuranLibrary().quranCtrl.lastPage)
        .arabicName;
  }
}
