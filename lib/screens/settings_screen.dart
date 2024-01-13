import 'package:flutter/material.dart';
import 'package:quran/services/theme_services.dart';

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
        title: const Text('الإعدادات'),
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
          )
        ],
      ),
    );
  }
}
