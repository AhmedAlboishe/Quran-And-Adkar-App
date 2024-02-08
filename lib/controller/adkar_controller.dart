// import 'dart:ffi';

// import 'package:get/get.dart';
// import '../model/adkar_model.dart';
// import '../services/adkar_service.dart';
// import '../services/data_client.dart';

// class AdkarCtrl extends GetxController {
//   RxList adkar = <Adkar>[].obs;
//   late int count;
//   final DataClient _dataClient = DataClient();

//   @override
//   void onInit() {
//     count = AdkarServices().loadTotalAdkarFromStorage();
//     print('on Init || count---->$count');
//     super.onInit();
//   }

//   getAdkar(String category) async {
//     adkar.value = await _dataClient.query(
//         tableName: 'adkar', where: 'category = "$category"');
//     return adkar;
//   }

//   void countOnTap() {
//     count++;
//     AdkarServices().saveAdkarNumberToStorage(totalAdkar: count);
//   }
// }
