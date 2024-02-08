import 'package:get/get.dart';
import '../model/adkar_model.dart';
import '../services/adkar_service.dart';
import '../services/data_client.dart';

class AdkarCtrl extends GetxController {
  RxList adkar = <Adkar>[].obs;
  late int count;
  RxInt disappearedCount = 0.obs;
  RxInt totalAdkar = 0.obs;
  final DataClient _dataClient = DataClient();
  final AdkarServices adkarServices = AdkarServices();

  @override
  void onInit() {
    count = adkarServices.loadTotalAdkarFromStorage();
    print('on Init || count---->$count');
    super.onInit();
  }

  getAdkar(String category) async {
    adkar.value = await _dataClient.query(
        tableName: 'adkar', where: 'category = "$category"');
    return adkar;
  }

  void countOnTap() {
    count++;
    adkarServices.saveAdkarNumberToStorage(totalAdkar: count);
  }

  addDeker(String category, String deker, String repetition) async {
    int response = await _dataClient.insert('adkar', {
      'category': category,
      'deker': deker,
      'repetition': int.parse(repetition),
    });
    print('insert --->$response');

    adkar.addAll(
        await _dataClient.query(tableName: 'adkar', where: 'id = $response'));
    print(adkar.length);
  }

  void onDekerDisappear() {
    // log('_onDekerDisappear $disappearedCount');

    disappearedCount.value++;
    if (disappearedCount.value == adkar.length) {
      // تنفيذ الكود الذي تريده عند اختفاء جميع العناصر
      // _showOverlayMessage("تم اختفاء جميع العناصر");
      totalAdkar.value = adkarServices.loadTotalAdkarFromStorage();
      // setState(() {});
      // Future.delayed(const Duration(milliseconds: 1200), () {
      //   if (mounted) {
      //     setState(() {
      //       showExit = true;
      //     });
      //   }
      // });
    }
  }
}
