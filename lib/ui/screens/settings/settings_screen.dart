import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/services/theme_services.dart';
import 'package:quran/ui/size_config.dart';

import '../islamic Occasions/islamic_occasions_screen.dart';
import 'widgets/list_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الإعدادات',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          CusListTile(
            title: 'الوضع الليلي',
            onTap: () {
              ThemeServices().switchThemeMode();
              setState(() {});
            },
            trailing: Switch(
              value: ThemeServices().loadThemFromStorage(),
              onChanged: (value) {
                ThemeServices().switchThemeMode();
                setState(() {});
              },
            ),
            icon: Icons.dark_mode_outlined,
          ),
          // CusListTile(
          //     onTap: () => Get.to(() => const NotificationScreen()),
          //     title: 'التنبيهات',
          //     icon: Icons.alarm),

          CusListTile(
              onTap: () => Get.to(() => const IslamicOccasionsScreen()),
              title: 'المناسبات الإسلامية',
              icon: Icons.date_range_rounded),
          ListTile(
            leading: Icon(
              CupertinoIcons.info,
              color: context.theme.iconTheme.color!,
            ),
            title: const Text('الإصدار 1.0.0'),
          ),
          // const Spacer(),
          // const Opacity(
          //     opacity: 0.5,
          //     child: Text(
          //       'تم تصميمه وتطويره من قِبل\nأحمد البوعيشي',
          //       textAlign: TextAlign.center,
          //     )),
          // const SizedBox(
          //   height: 90,
          // )
        ],
      ),
    );
  }
}
