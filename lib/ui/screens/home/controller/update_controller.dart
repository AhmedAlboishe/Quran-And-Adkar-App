import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';

class UpdateController extends GetxController {
  late AppUpdateInfo _appUpdateInfo;

  @override
  onInit() async {
    await checkForUpdates();
    super.onInit();
  }

  Future<void> checkForUpdates() async {
    _appUpdateInfo = await InAppUpdate.checkForUpdate();
    log('${_appUpdateInfo.updateAvailability}');
    if (_appUpdateInfo.updateAvailability ==
        UpdateAvailability.updateAvailable) {
      try {
        await InAppUpdate.startFlexibleUpdate();
      } on PlatformException catch (e) {
        Fluttertoast.showToast(msg: 'حدث خطأ');
      } catch (e) {
        Fluttertoast.showToast(msg: 'حدث خطأ');
      }
    }
  }
}
