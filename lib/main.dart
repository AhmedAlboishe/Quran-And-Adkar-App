import 'package:flutter/material.dart';
import 'package:quran/bottom_nav_bar_icon.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const BottonNavWithAnimatedIcons(),
    );
  }
}
