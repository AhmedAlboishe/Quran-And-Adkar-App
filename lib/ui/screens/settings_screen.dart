import 'package:flutter/material.dart';
import 'package:quran/services/theme_services.dart';
import 'package:quran/ui/size_config.dart';

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
          ListTile(
            title: const Text('الوضع الليلي'),
            trailing: Switch(
              value: ThemeServices().loadThemFromStorage(),
              onChanged: (value) {
                ThemeServices().switchThemeMode();
                setState(() {});
              },
            ),
            onTap: () {
              ThemeServices().switchThemeMode();
              setState(() {});
            },
          ),
          const ListTile(
            title: Text('الإصدار 1.0.0 (تجريبي)'),
          ),
          const Spacer(),
          const Opacity(
              opacity: 0.5,
              child: Text(
                'تم تصميمه وتطويره من قِبل\nأحمد البوعيشي',
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            height: 90,
          )
        ],
      ),
    );
  }
}
