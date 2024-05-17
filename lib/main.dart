import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:quran/services/data_client.dart';
import 'package:quran/services/theme_services.dart';
import 'package:quran/ui/bottom_nav_bar_icon.dart';
import 'package:quran/ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DataClient().database;
  // NotifyHelper().initializationNotification();
  // Notify.init();
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});
  // final QuranController quranController = Get.put(QuranController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: const BottonNavWithAnimatedIcons(),
    );
  }
}
