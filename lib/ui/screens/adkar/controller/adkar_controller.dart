import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../core/helper/dialog_helper.dart';
import '../model/adkar_model.dart';
import '../../../../services/adkar_service.dart';
import '../../../../services/data_client.dart';

// there is problem when i add deker in empty list
class AdkarController extends GetxController {
  RxList<Adkar> adkar = <Adkar>[].obs;
  RxInt count = 0.obs;
  RxList<int> counter = <int>[].obs;
  RxInt disappearedCount = 0.obs;
  RxBool isDarkMode = Get.isDarkMode.obs;
  RxInt totalAdkar = 0.obs;
  RxBool showEdit = false.obs;
  RxBool showAdkarCalculator = false.obs;
  RxBool allDekerDisappear = false.obs;
  RxBool showExitButton = false.obs;
  final DataClient _dataClient = DataClient();
  final AdkarServices adkarServices = AdkarServices();
  final TextEditingController dekerCtrl = TextEditingController();
  final TextEditingController repetitionCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    // await getAdkar(category)

    totalAdkar.value = adkarServices.loadTotalAdkarFromStorage();

    print('on Init || count---->$count');
    super.onInit();
  }

  void getAdkar(String category) async {
    adkar.addAll(await _dataClient.query(
        tableName: 'adkar', where: 'category = "$category"'));
    for (var _ in adkar) {
      counter.addAll([-1]);
    }

    // return adkar;
  }

  void countOnTap({required int index, required int c}) {
    log('tap ->>> count++');

    counter[index] = ++c;
    ++count.value;
    // totalAdkar.value = ++totalAdkar.value;
    adkarServices.saveAdkarNumberToStorage(totalAdkar: ++totalAdkar.value);
  }

  void onDekerDisappear() {
    // log('_onDekerDisappear $disappearedCount');

    disappearedCount.value++;
    if (disappearedCount.value == adkar.length) {
      // تنفيذ الكود الذي تريده عند اختفاء جميع العناصر
      // _showOverlayMessage("تم اختفاء جميع العناصر");
      allDekerDisappear.value = true;
      totalAdkar.value = adkarServices.loadTotalAdkarFromStorage();
      log('_onDekerDisappear $disappearedCount');

      Future.delayed(const Duration(milliseconds: 1200), () {
        showExitButton.value = true;
      });
    }
  }

  onDekerAdd({
    required String category,
    required TextEditingController dekerController,
    required TextEditingController repetitionController,
  }) async {
    if (formKey.currentState!.validate()) {
      int response = await _dataClient.insert('adkar', {
        'category': category,
        'deker': dekerController.text,
        'repetition': int.parse(repetitionController.text),
      });
      print('insert --->$response');

      adkar.addAll(
          await _dataClient.query(tableName: 'adkar', where: 'id = $response'));
      counter.addAll([-1]);
      print(adkar.length);
      if (response != 0) {
        Fluttertoast.showToast(
            msg: 'تم إضافة الذِكِر', backgroundColor: const Color(0xFF616161));
      }
      Get.back();
      dekerController.text = '';
      repetitionController.text = '';
    }
  }

  addDeker({
    required BuildContext context,
    required String category,
  }) {
    showEdit.value = false;
    DialogHelper.dialog(
        dekerController: dekerCtrl,
        repetitionController: repetitionCtrl,
        context: context,
        title: 'إضافة ذِكِر',
        formKey: formKey,
        onCancel: () {
          Get.back();
          dekerCtrl.text = '';
          repetitionCtrl.text = '';
        },
        // onSaved: _onDekerAdd,
        onSaved: () => onDekerAdd(
            category: category,
            dekerController: dekerCtrl,
            repetitionController: repetitionCtrl));
  }

  Future onUpdate(int id) async {
    // adkar list is <Adkar>[].obs
    List<Adkar> data =
        await _dataClient.query(tableName: 'adkar', where: 'id = $id');
    showEdit.value = false;
    for (int i = 0; i < adkar.length; i++) {
      if (adkar[i].id == id) {
        print('update list success $id==${adkar[i].id}');
        // print('before---> ${adkar[i].repetition}');
        adkar[i] = data[0];
        // print('before---> ${adkar[i].repetition}');
      }
    }
  }

  // dekerController.text = deker = data[0].deker;
  // repetition = data[0].repetition;
  // widget.onEditeDone();
  // setState(() {});
  onEditePresse(
      {required GlobalKey<FormState> formKey,
      required BuildContext context,
      required TextEditingController dekerController,
      required TextEditingController repetitionController,
      required int id}) {
    DialogHelper.dialog(
        title: 'تعديل الذِكِر',
        formKey: formKey,
        context: context,
        dekerController: dekerController,
        repetitionController: repetitionController,
        onSaved: () async {
          if (formKey.currentState!.validate()) {
            int response = await _dataClient.update(
                tableName: 'adkar',
                values: {
                  'deker': dekerController.text,
                  'repetition': int.parse(repetitionController.text)
                },
                whereId: id);
            print('$response ***-------------');
            // await onUpdate();
            onUpdate(id);
            Get.back();
            Fluttertoast.showToast(
                msg: 'تم تعديل الذِكِر',
                backgroundColor: const Color(0xFF616161));
          }
        },
        onCancel: () async {
          // onEditeDone();
          showEdit.value = false;

          Get.back();
          // dekerController.text = deker;
          // repetitionController.text = repetition.toString();
        });
  }

  onDeletePresse({required Adkar deker, required int index}) {
    Get.dialog(
        Dialog(
          child: Container(
            padding:
                const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('هل ترغب في حذف الذِكِر؟'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () async {
                        int response =
                            await _dataClient.delete('adkar', deker.id);
                        print('delete -->$response\nI am in controller');
                        onDekerDisappear();
                        counter[index] = deker.repetition; //-1
                        Get.back();
                        showEdit.value = false;

                        Fluttertoast.showToast(
                            msg: 'تم حذف الذِكِر',
                            backgroundColor: const Color(0xFF616161));
                      },
                      child: const Text(
                        'حذف',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // widget.onEditeDone();
                        showEdit.value = false;

                        Get.back();
                      },
                      child: Text(
                        'إلغاء',
                        style: TextStyle(
                          color: Colors.red.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
